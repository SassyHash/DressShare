class DressesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :photo]
  # autocomplete :brand, :on => :collection
  # autocomplete :color, :on => :collection
  def new
    @brands = Dress.pluck("brand").uniq
    @colors = Dress.pluck("color").uniq
    @dress = Dress.new
  end

  def create
    photo_file= params[:dress].delete(:photo_blob)
    photo_blob = photo_file.nil? ? nil : photo_file.read
    @dress = Dress.new(params[:dress])
    @dress.owner_id = current_user.id
    @dress.photo_blob = photo_blob

    if @dress.save
      flash[:notices] = "Your dress is hung in our closet!"
      redirect_to dress_path(@dress)
    else
      render 'new'
    end
  end

  def show
    @dress = Dress.find(params[:id])
  end

  def edit
    @dress = Dress.find(params[:id])
  end

  def update
    @dress = Dress.find(params[:id])
    if params[:dress][:photo_blob]
      photo_file= params[:dress].delete(:photo_blob)
      photo_blob = photo_file.nil? ? nil : photo_file.read
      @dress.photo_blob = photo_blob
    end
    @dress.update_attributes(params[:dress])

    if @dress.save
      if @dress.save
        flash[:notices] = "Your dress has been updated."
        redirect_to dress_path(@dress)
      else
        render 'edit'
      end
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
    if params[:search]
      params[:search][:size_search_ids].pop
      params[:search][:body_type_ids].pop

      @dresses = Dress.search(params[:search])

      size_searches = params[:search].delete(:size_search_ids)
      body_type_searches = params[:search].delete(:body_type_ids)

      @search.update_attributes(params[:search])

      size_searches.each do |size_string|
        SizeSearch.create(:size => size_string.to_i, :search_id => @search.id)
      end
      body_type_searches.each do |body_type|
        BodyTypeSearch.create(:body_type_id => body_type.to_i, :search_id => @search.id)
      end
    else
      @dresses = Dress.all
    end

    @brands = Dress.pluck("brand").uniq
    @colors = Dress.pluck("color").uniq


  end

  def photo
    dress = Dress.find(params[:id])
    if dress.photo_blob
      send_data dress.photo_blob, :type => 'image/jpg', :disposition => 'inline'
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
