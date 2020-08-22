class ItemPhoto < ApplicationRecord
  belongs_to :post
  attachment :photo

  validates :photo, presence:true


end
