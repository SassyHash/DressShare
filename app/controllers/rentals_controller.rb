class RentalsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :rental_owner?, :only => [:edit, :destroy]

  def new
    @dress = Dress.find(params[:dress_id])
    @rental = Rental.new

  end

  def create
    start_date = params[:rental].delete(:start_date)
    end_date = params[:rental].delete(:end_date)

    @rental = Rental.new(params[:rental])
    @rental.dress_id, @rental.user_id = params[:dress_id], current_user.id
    @rental.start_date, @rental.end_date = start_date, end_date

    @owner = @rental.owner
    if @rental.save
      UserMailer.request_owner(@owner, current_user, @rental).deliver
      flash[:notices] = "You have requested to rent this dress."
      redirect_to rental_url(@rental)
    else
      @dress = Dress.find(params[:dress_id])
      render 'new'
    end
  end

  def edit
    @rental = Rental.find(params[:id])
    @dress = Dress.find(@rental.dress_id)
  end

  def update
    @rental=Rental.find(params[:id])
    @dress = Dress.find(@rental.dress_id)
    old_answer = @rental.accepted
    old_start_date, old_end_date = @rental.start_date, @rental.end_date

    if @rental.update_attributes(params[:rental])
      flash[:notices] = "You have updated your rental details."
    end

    new_answer = @rental.accepted
    if old_answer != new_answer
      UserMailer.notify_renter_denied(@rental.user, @rental).deliver if !new_answer
      UserMailer.notify_renter_accepted(@rental.user, @rental).deliver if new_answer
    end

    new_start_date, new_end_date = @rental.start_date, @rental.end_date
    if new_start_date != old_start_date || new_end_date != old_end_date
      UserMailer.notify_renter_owner_changes(@rental.user, @rental.owner, @rental)
    end

    respond_to do |format|
      format.html { render :show }
      format.json { render :json => @rental }
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    if @rental
      @rental.destroy
      flash[:error] = "You have canceled your rental request."
    end
    redirect_to dresses_url
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

  def rental_owner?
    @rental = Rental.find(params[:id])
    if current_user.id == @rental.user_id
    else
      flash[:error] = "You did not request this rental. You are not authorized to modify it."
      redirect_to dresses_url
    end
  end
end
