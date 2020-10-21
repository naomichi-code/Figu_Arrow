class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @posts = Post.page(params[:page]).per(20).order(created_at: :desc)
    @post_count_day = Post.where(created_at: Time.zone.now.all_day)
    @post_count_all = Post.all
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admins_posts_path
  end
end
