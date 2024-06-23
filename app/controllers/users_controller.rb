class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.post
  end

  def edit
    @user = User.find(params[:id])
  end
end
