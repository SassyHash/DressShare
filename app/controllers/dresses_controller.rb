class DressesController < ApplicationController
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
      flash[:notices] = [] unless flash[:notices]
      flash[:notices] << "Your dress is hung in our closet!"
      redirect_to dress_path(@dress)
    else
      p @dress.errors
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

  end

  def destroy
  end

  def index
    @dresses = Dress.all
  end


  def my_dresses
    @dress = Dress.find_by_owner_id(current_user.id)
    render 'index'
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
