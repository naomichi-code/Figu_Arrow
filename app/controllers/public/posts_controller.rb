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
    if @user.image_icon.nil?
      @image_icon_url = 'no-image-icon.jpg'
    else
      @image_icon_url = Settings.image_icon_url + @user.image_icon_id + "-thumbnail."
    end
  end

  def index
    @posts = Post.page(params[:page]).per(12).order(created_at: :desc)
    @posts.each do |post|
      #@item_photos_url = "https://figu-arrow-s3-resize.s3-ap-northeast-1.amazonaws.com/store/" + post.item_photos_id.first + "-thumbnail."
      @item_photos_url = post.item_photos.first
    end
  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      redirect_to post_path(post)
    else
      @post = post
      @post.item_photos.build
      @tags = post.tags.new
      render 'new'
    end
  end

  def destroy
    user = @post.user.id
    @post.destroy
    redirect_to user_path(user)
  end

  def edit
    @tags = @post.tags.all
  end

  def update
    if @post.update(post_params)
      sleep(3)
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
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
        redirect_to posts_path
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
