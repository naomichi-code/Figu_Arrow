class Tag < ApplicationRecord
  belongs_to :post
  validates :brand_tag, presence: true,length: {maximum: 15, minimum: 1}
  validates :title_tag, presence: true,length: {maximum: 15, minimum: 1}
  validates :chara_tag, presence: true,length: {maximum: 15, minimum: 1}
end
