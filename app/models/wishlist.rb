class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :recipes, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
