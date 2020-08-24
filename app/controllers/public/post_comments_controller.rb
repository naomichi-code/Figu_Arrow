class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.new(post_comment_params)
    @post_comment.user_id =current_user.id
    if @post_comment.save
       @post_comments = PostComment.all
      flash[:success] = "Comment was successfully created."
    else
      @items = @post.item_photos
      @tags = @post.tags
      @user = @post.user
      @post_comment = PostComment.new
      @post_comments = @post.post_comments
      render 'public/posts/show'
    end
  end
  def destroy
    @post_comment = PostComment.find(params[:post_id])
    @post_comment.destroy
    @post = @post_comment.post
    @post_comments = PostComment.all
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
