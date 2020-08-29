class GroupChat < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :message, presence: true,length: {maximum: 60, minimum: 1}
end
