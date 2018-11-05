class Item < ApplicationRecord
  belongs_to :wishlist
  belongs_to :recipe
end
