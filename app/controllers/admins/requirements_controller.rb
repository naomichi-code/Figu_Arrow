class Admins::RequirementsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_group, only: [:show, :destroy]

  def index
    @gives = Post.where(status: 1).page(params[:page]).per(10).order(updated_at: :desc)
    @give_count_day = @gives.where(created_at: Time.zone.now.all_day)
    @give_count_all = Post.where(status: 1)
    @exchanges = Post.where(status: 2).page(params[:page]).per(10).order(updated_at: :desc)
    @exc_count_day = @exchanges.where(created_at: Time.zone.now.all_day)
    @exc_count_all = Post.where(status: 2)
  end
end
