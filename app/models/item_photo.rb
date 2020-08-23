class ItemPhoto < ApplicationRecord
  MAX_ITEM_PHOTOS_COUNT = 5
  belongs_to :post
  attachment :photo

  validate :posts_count_must_be_within_limit
  private
  def posts_count_must_be_within_limit
    errors.add(:base, "item_photos count limit: #{MAX_ITEM_PHOTOS_COUNT}") if post.item_photos.count >= MAX_ITEM_PHOTOS_COUNT
  end
end
