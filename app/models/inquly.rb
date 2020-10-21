class Inquly < ApplicationRecord
  validates :name, presence: true,length: {maximum: 15, minimum: 1}
  validates :email, presence: true
  validates :body, presence: true, length: {maximum: 300}
end
