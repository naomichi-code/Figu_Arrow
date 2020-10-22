class Inquly < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true,length: {maximum: 15, minimum: 1}
  validates :email, presence: true,format: {with: VALID_EMAIL_REGEX}
  validates :body, presence: true, length: {maximum: 300}
end
