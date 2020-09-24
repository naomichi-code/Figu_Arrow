class Public::HomesController < ApplicationController
  def top
    @posts = Post.page(params[:page]).per(6).order(created_at: :desc)
    @requirements = Post.where(status: 1).or(Post.where(status: 2)).page(params[:page]).per(6).order(updated_at: :desc)

  end

  def about
  end

end
