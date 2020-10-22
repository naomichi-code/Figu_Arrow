class Users::UsersController < ApplicationController
  before_action :authenticate_user!,unless: :admin_signed_in?
  before_action :set_user, only:[:show, :edit, :update, :destroy,:followings,:followers]
  before_action :screen_user, only: [:edit, :update]

  def show
    @posts = @user.posts.page(params[:page]).per(12).order(created_at: :desc)
    if @user.image_icon.nil?
      @image_icon_url = 'no-image-icon.jpg'
    else
      @image_icon_url = Settings.image_icon_url + @user.image_icon_id + "-thumbnail."
    end
  end

  def edit
    if @user.image_icon.nil?
      @image_icon_url = 'no-image-icon.jpg'
    else
      @image_icon_url = Settings.image_icon_url + @user.image_icon_id + "-thumbnail."
    end
  end

  def update
    if @user.update(user_params)
      sleep(3)
      redirect_to user_path(@user)
    else
      if @user.image_icon.nil?
        @image_icon_url = 'no-image-icon.jpg'
      else
        @image_icon_url = Settings.image_icon_url + @user.image_icon_id + "-thumbnail."
      end
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def following
    @users = @user.followig_user
  end

  def follower
    @users = @user.follower_user
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
        :image_icon
    )
  end
  def screen_user
    unless params[:id].to_i == current_user.id
        redirect_to user_path(current_user)
    end
  end
end