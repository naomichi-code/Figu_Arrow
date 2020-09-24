class Group < ApplicationRecord
  has_many :group_rooms, dependent: :destroy
  has_many :group_chats, dependent: :destroy
  has_many :users, through: :group_rooms
  attachment :thumbnail
  validates :room_title, presence: true
  validates :body, presence: true
  validates :thumbnail, presence: true

end
