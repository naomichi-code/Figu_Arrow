class Post < ApplicationRecord
has_many :arrows
has_many :post_comments
has_many :tags
has_many :item_photos
belongs_to :user
end
