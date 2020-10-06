class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page]).per(20).order(created_at: :desc)
    @user_count = User.where(created_at: Time.zone.now.all_day)#本日の登録者数
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_users_path
  end
end
