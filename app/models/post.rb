class Post < ApplicationRecord
  has_many :arrows, dependent: :destroy
  has_many :post_comments,dependent: :destroy
  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags, allow_destroy: true
  has_many :item_photos, dependent: :destroy
  accepts_attachments_for :item_photos, attachment: :photo
  belongs_to :user

  validates :title, presence: true,length: {maximum: 15, minimum: 1}
  validates :body, presence: true, length: {maximum: 300}
  validates :requirement, length: {maximum: 300}

  #enum status: { "設定なし" => 0, "譲渡可" => 1, "交換可" => 2}

  def arrowed_by?(user)
    arrows.where(user_id: user.id).exists?
  end

end
