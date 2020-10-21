class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :destroy, :edit, :update]

  def index
    @users = User.page(params[:page]).per(20).order(created_at: :desc)
    @user_count_day = User.where(created_at: Time.zone.now.all_day)#本日の登録者数
    @user_count_all = User.all
  end

  def show
  end

  def edit
  end

  def update
      if @user.update(user_params)
        redirect_to admins_user_path(@user)
      else
        render 'edit'
      end
  end

  def destroy
    @user.destroy
    redirect_to admins_users_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
        :account_name,
        :last_name,
        :first_name,
        :last_name_kana,
        :first_name_kana,
        :email,
        :postal_code,
        :address,
        :phone_number,
        :introduction,
    )
  end
end
