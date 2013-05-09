DressShare::Application.routes.draw do
  devise_for :users,
  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :static_pages
  resources :rentals, :only => [:edit, :update, :show, :destroy]

  resources :users, :only => :index do
    resources :rentals, :only => :index
  end

  resources :dresses do
    # get :autocomplete_brand, :on => :collection
    # get :autocomplete_color, :on => :collection
    resources :rentals, :only => [:new, :create]
    collection do
      get 'search'
    end
    member do
      get "photo"
    end
  end

  root :to => "dresses#index"

  devise_scope :user do
    get "/signin", :to => "devise/sessions#new"
    delete "/signout", :to => "devise/sessions#destroy"
    get "/signup", :to => "devise/registrations#new"
    match '/confirm/:confirmation_token', :to => "devise/confirmations#show", :as => "user_confirm", :only_path => false
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end

  resources :users, :only=> :show
  get "/contact_us", :to => "static_pages#contact"
  get "/about_us", :to => "static_pages#about"
  get "/our_story", :to => "static_pages#story"
  get "/legal_stuff", :to => "static_pages#legal"

end