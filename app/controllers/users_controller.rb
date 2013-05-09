class UsersController < ApplicationController
  before_filter :authenticate_user!

  def new

  end

  def create

  end

  def index
  end

  def destroy
  end

  def show
    @user = User.find(params[:id])
    if current_user != @user
      flash[:error] = "You are not authorized to view this page."
    else
      @dresses = Dress.find_by_owner_id(params[:id])
    end
  end

  def edit
  end

  def update
  end

end
