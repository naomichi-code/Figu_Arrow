class Public::ArrowsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    arrow = @post.arrows.new(user_id: current_user.id)
    arrow.save
    
  end

  def destroy
    @post = Post.find(params[:post_id])
    arrow = current_user.arrows.find_by(post_id: @post.id)
    arrow.destroy
  end
end
