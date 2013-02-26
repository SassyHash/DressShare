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
  end

  def edit
  end

  def update
  end

end
