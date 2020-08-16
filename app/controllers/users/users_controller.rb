class Users::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only:[:show, :edit, :update, :destroy,:followings,:followers]
    before_action :screen_user, only: [:edit, :update]
    def show

    end

    def following
        user = User.find(prams[:user_id])
        @users = user.followig_user
      end
    
      def follower
        user = User.find(prams[:user_id])
        @user = user.follower_user
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
            :phone_number
        )
    end
    def screen_user
        unless params[:id].to_i == current_user.id
            redirect_to user_path(current_user)
        end
    end
end
