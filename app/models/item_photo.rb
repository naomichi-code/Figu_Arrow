class ItemPhoto < ApplicationRecord
  belongs_to :post
  attachment :photo

end
