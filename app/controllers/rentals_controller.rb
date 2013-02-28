class RentalsController < ApplicationController
  def new
    @dress = Dress.find(params[:dress_id])
    @rental = Rental.new
    @rental.dress_id = @dress.id
    @rental.user_id = current_user.id
  end

  def create
    @rental = Rental.new(:params[:rental])
    if @rental.save
      flash[:notices] = [] unless flash[:notices]
      flash[:notices] << "You have requested to rent this dress."
      redirect_to rental_path(@rental)
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
