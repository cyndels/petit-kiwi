class Wishlist < ApplicationRecord
  has_many :items
  has_many :recipes, through: :items
  belongs_to :user
  validates :name, presence: true, uniqueness: true
end
