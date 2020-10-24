class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.new(post_comment_params)
    @post_comment.user_id =current_user.id
    if @post_comment.save
      @post_comments = @post.post_comments
    else
      @items = @post.item_photos
      @tags = @post.tags
      @user = @post.user
      @post_comment = PostComment.new
      @post_comments = @post.post_comments
      if @user.image_icon.nil?
        @image_icon_url = 'no-image-icon.jpg'
      else
        @image_icon_url = Settings.image_icon_url + @user.image_icon_id + "-thumbnail."
      end
      render 'public/posts/show'
    end
  end
  def destroy
    @post_comment = PostComment.find(params[:post_id])
    @post = Post.find(@post_comment.post_id)
    @post_comments = PostComment.where(post_id: @post_comment.post_id)
    @post_comment.destroy

  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
