class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :destroy]

  def index
    @users = User.page(params[:page]).per(20).order(created_at: :desc)
    @user_count_day = User.where(created_at: Time.zone.now.all_day)#本日の登録者数
    @user_count_all = User.all
  end

  def show
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_users_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end
