class Admin::UsersController < ApplicationController
  layout 'admin'

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました。'
  end

  def show
    @user = User.find(params[:id])
  end
end