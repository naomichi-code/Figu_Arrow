class Admins::InquliesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @inqulies = Inquly.page(params[:page]).per(20).order(created_at: :desc)
    @inqulies_count_day = User.where(created_at: Time.zone.now.all_day)
    @inqulies_count_all = User.all
  end
  def show
    @inqulies = Inquly.find(params[:id])
  end

  def destroy
    @inqulies = Inquly.find(params[:id])
    @inqulies.destroy
    redirect_to admins_inqulies_path
  end

end
