class DressesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :photo]
  before_filter :dress_owner?, :only => [:edit, :destroy]
  caches_action :index, :show
  
  cache_sweeper :dress_sweeper
  # autocomplete :brand, :on => :collection
  # autocomplete :color, :on => :collection
  def new
    @brands = Dress.pluck("brand").uniq
    @colors = Dress.pluck("color").uniq
    @dress = Dress.new
    @body_types = BodyType.all
  end

  def create
    @dress = Dress.new(params[:dress])
    @dress.owner_id = current_user.id
    @dress.body_types << BodyType.find(params[:body_types]) unless params[:body_types].nil? 
    @dress.size = params[:size][0].to_i unless params[:size].nil?
    @dress.photo2 = nil unless params[:dress][:photo2]
    @dress.photo3 = nil unless params[:dress][:photo3]

    if @dress.save
      flash[:notices] = "Your dress is hung in the Closet!"
      redirect_to dress_path(@dress)
    else
      render 'new'
    end
  end

  def show
    @dress = Dress.find(params[:id])
  end

  def edit
    @body_types = BodyType.all
    @dress = Dress.find(params[:id])
  end

  def update
    @dress = Dress.find(params[:id])
    @dress.update_attributes(params[:dress])
    @dress.body_types << BodyType.find(params[:body_types]) unless params[:body_types].nil? 
    @dress.size = params[:size][0].to_i unless params[:size].nil?
    @dress.photo2 = nil unless params[:dress][:photo2]
    @dress.photo3 = nil unless params[:dress][:photo3]

    if @dress.save
      flash[:notices] = "Your dress has been updated."
      redirect_to dress_path(@dress)
    else
      render 'edit'
    end
  end

  def destroy
    @dress = Dress.find(params[:id])
    if @dress
      @dress.destroy
      flash[:error] = "You have removed a dress."
    end

    if request.xhr?
      render :nothing => true
    else
      redirect_to user_path(current_user)
    end
  end

  def index
    @search = Search.new
    @body_types = BodyType.all    
    @brands = Dress.pluck("brand").uniq.sort!
    @colors = Dress.pluck("color").uniq.sort!

    if params[:search]
      params[:search][:sizes] = params[:sizes]
      params[:search][:body_types] = params[:body_types].collect {|a| a.to_i}
      @dresses = Dress.search(params[:search])

      # size_searches = params[:search].delete(:size_search_ids)
      # body_type_searches = params[:search].delete(:body_type_ids)

      # @search.update_attributes(params[:search])

      # size_searches.each do |size_string|
      #   SizeSearch.create(:size => size_string.to_i, :search_id => @search.id)
      # end
      # body_type_searches.each do |body_type|
      #   BodyTypeSearch.create(:body_type_id => body_type.to_i, :search_id => @search.id)
      # end
    else
      @dresses = Dress.all
    end


  end

  def photo
    dress = Dress.find(params[:id])
    if dress.photo_blob
      send_data dress.photo_blob, :type => 'image/jpg', :disposition => 'inline'
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def dress_owner?
    @dress = Dress.find(params[:id])
    if current_user.id == @dress.owner_id
    else
      flash[:error] = "This dress is not yours. You are not authorized to modify it."
      redirect_to dress_url(@dress)
    end
  end
end
