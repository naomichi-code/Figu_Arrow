class Group < ApplicationRecord
  has_many :group_rooms
  has_many :group_chats
  attachment :thumbnail
end
