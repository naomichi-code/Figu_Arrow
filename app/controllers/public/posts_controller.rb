class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only:[:show, :edit, :update, :destroy]
  before_action :screen_user, only: [:edit, :update]

  def new
    @post = Post.new
    @post.item_photos.build
    @tags = @post.tags.new
  end

  def show
    @items = @post.item_photos
    @tags = @post.tags
    @user = @post.user
    @post_comment = PostComment.new
    @post_comments = @post.post_comments
  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      redirect_to post_path(post)
    else

      render 'new'
    end
  end

  private
  #投稿をセット
  def set_post
    @post = Post.find(params[:id])
  end
  #カレントユーザー以外をリダイレクト
  def screen_user
    unless params[:id].to_i == current_user.id
        redirect_to user_path(current_user)
    end
  end

  def post_params
    params.require(:post).permit(
        :title,
        :body,
        :requirement,
        :status,
        item_photos_photos: [],
        tags_attributes: [:brand_tag, :title_tag, :chara_tag, :_destroy, :id]
    )
  end

end
