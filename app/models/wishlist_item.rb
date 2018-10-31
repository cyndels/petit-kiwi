class WishlistItem < ApplicationRecord
  belongs_to :wishlist
  belongs_to :recipe
end
