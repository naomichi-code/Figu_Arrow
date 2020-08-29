class Public::SearchController < ApplicationController


  def search
    @model = params["search"]["model"]#モデル受け取り
    @content = params["search"]["content"]#検索ワード受け取り
    @method = params["search"]["method"]#検索方法受け取り
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
      #ユーザー
    if model == 'user'
      if method == 'perfect'
        User.where(account_name: content)#完全一致
      elsif method == 'forward'
        User.where('account_name LIKE ?', content+'%')#前方一致
      elsif method == 'backward'
        User.where('account_name LIKE ?', '%'+content)#後方一致
      else
        User.where('account_name LIKE ?', '%'+content+'%')#部分一致
      end
      #投稿検索
    elsif model == 'post'
      if method == 'perfect'
        Post.where(title: content)
      elsif method == 'forward'
        Post.where('title LIKE ?', content+'%')
      elsif method == 'backward'
        Post.where('title LIKE ?', '%'+content)
      else
        Post.where('title LIKE ?', '%'+content+'%')
      end
      #タグ検索
    elsif model == 'brand'
      if method == 'perfect'
        Tag.where(brand_tag: content)
      elsif method == 'forward'
        Tag.where('brand_tag LIKE ?', content+'%')
      elsif method == 'backward'
        Tag.where('brand_tag LIKE ?', '%'+content)
      else
        Tag.where('brand_tag LIKE ?', '%'+content+'%')
      end
        #作品タイトル
    elsif model == 'title'
      if method == 'perfect'
        Tag.where(title_tag: content)
      elsif method == 'forward'
        Tag.where('title_tag LIKE ?', content+'%')
      elsif method == 'backward'
        Tag.where('title_tag LIKE ?', '%'+content)
      else
        Tag.where('title_tag LIKE ?', '%'+content+'%')
      end
        #キャラ名
    elsif model == 'chara'
      if method == 'perfect'
        Tag.where(chara_tag: content)
      elsif method == 'forward'
        Tag.where('chara_tag LIKE ?', content+'%')
      elsif method == 'backward'
        Tag.where('chara_tag LIKE ?', '%'+content)
      else
        Tag.where('chara_tag LIKE ?', '%'+content+'%')
      end
    end
  end
end
