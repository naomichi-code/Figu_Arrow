class Post < ApplicationRecord
  has_many :arrows, dependent: :destroy
  has_many :post_comments,dependent: :destroy
  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags, allow_destroy: true
  has_many :item_photos, dependent: :destroy
  accepts_nested_attributes_for :item_photos, allow_destroy: true
  belongs_to :user

  validates :title, presence: true,length: {maximum: 20, minimum: 1}
  validates :body, presence: true, length: {maximum: 300}
  validates :requirement, length: {maximum: 300}
  #validates :item_photo, plasence:true


  enum status: {"設定無し" => 0, "譲渡可" => 1, "交換可" => 2}

end
