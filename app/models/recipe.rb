class Recipe < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  has_many :instructions, dependent: :destroy

  has_many :items, dependent: :destroy
  has_many :wishlists, through: :items

  belongs_to :user

  enum category: [:Aperitif, :Entree, :Plat, :Dessert, :Dejeuner]
  validates :name, presence: true, uniqueness: true
  validates :category, :cooking_time, :party, presence: true
end
