class Public::PostsController < ApplicationController
  before_action :authenticate_user!,except: :index
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

  def index
    @posts = Post.all.reverse_order

  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      redirect_to post_path(post)
    else
      @post = Post.new
      @post.item_photos.build
      @tags = @post.tags.new
      render 'new'
    end
  end

  def destroy
    post = Post.find(params[:id])
    user = post.user.id
    post.destroy
    redirect_to user_path(user)
  end

  def edit
    @tags = @post.tags.all
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  private
  #投稿をセット
  def set_post
    @post = Post.find(params[:id])
  end
  #カレントユーザー以外をリダイレクト
  def screen_user
    unless @post.user_id == current_user.id
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
