class RentalsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @dress = Dress.find(params[:dress_id])
    @rental = Rental.new

  end

  def create
    @rental = Rental.new(params[:rental])
    @rental.dress_id = params[:dress_id]
    @rental.user_id = current_user.id

    if @rental.save
      flash[:notices] = "You have requested to rent this dress."
      redirect_to rental_path(@rental)
    else
      @dress = Dress.find(params[:dress_id])
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  def index

  end

end
