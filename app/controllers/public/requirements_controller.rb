class Public::RequirementsController < ApplicationController
  def index
    @gives = Post.where(status: 1).page(params[:page]).per(6).order(updated_at: :desc)
    @exchanges = Post.where(status: 2).page(params[:page]).per(6).order(updated_at: :desc)
  end
end
