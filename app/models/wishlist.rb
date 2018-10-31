class Wishlist < ApplicationRecord
  has_many :wishlist_items
  has_many :recipes, through: :wishlist_items
  belongs_to :user
  validates :name, presence: true, uniqueness: true
end
