class Public::TagsController < ApplicationController
  def index
    @brand = Tag.group(:brand_tag)
    @title = Tag.group(:title_tag)
    @chara = Tag.group(:chara_tag)
  end
  def show
    tag = Tag.find(params[:id])
    @colum = params[:tag]

    @brand = Tag.where(brand_tag: tag.brand_tag).page(params[:page]).per(12).order(created_at: :desc)
    @title = Tag.where(title_tag: tag.title_tag).page(params[:page]).per(12).order(created_at: :desc)
    @chara = Tag.where(chara_tag: tag.chara_tag).page(params[:page]).per(12).order(created_at: :desc)
  end

end
