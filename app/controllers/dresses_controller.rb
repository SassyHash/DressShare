class DressesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :photo]

  def new
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
      redirect_to user_path(current_user)
    end
  end

  def index
    @dresses = Dress.recent_ten
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
