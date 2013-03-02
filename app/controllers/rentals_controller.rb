class RentalsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @dress = Dress.find(params[:dress_id])
    @rental = Rental.new

  end

  def create
    @date = params[:rental].delete(:date_picker)
    @rental = Rental.new(params[:rental])
    @rental.dress_id = params[:dress_id]
    @rental.user_id = current_user.id
    @owner = @rental.owner
    if @rental.save
      UserMailer.request_owner(@owner, current_user, @rental).deliver
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
    @rental=Rental.find(params[:id])
    old_answer = @rental.accepted
    p old_answer
    @rental.update_attributes(params[:rental])
    new_answer = @rental.accepted
    if old_answer != new_answer

      UserMailer.notify_renter_denied(@rental.user, @rental).deliver if !new_answer
      UserMailer.notify_renter_accepted(@rental.user, @rental).deliver if new_answer
    end

    respond_to do |format|
      format.html { render :show }
      format.json { render :json => @rental }
    end


  end

  def destroy
  end

  def show
    @rental = Rental.find(params[:id])
    @dress = Dress.find(@rental.dress_id)
    if @rental.user_id == current_user.id
      if @rental.accepted
        flash[:notices] = "Your request has been accepted!"
      else
        flash[:error] = "Your request has not been accepted yet."
      end
    end

    respond_to do |format|
      format.html { render :show }
      format.json { render :json => @rental }
    end
  end

  def index

  end

end
