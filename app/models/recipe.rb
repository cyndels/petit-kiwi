class Recipe < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :instructions, dependent: :destroy
  has_many :ingredients, through: :doses
  belongs_to :user
  belongs_to :menu
  enum category: [:Aperitif, :Entree, :Plat, :Dessert, :Dejeuner]
  validates :name, presence: true, uniqueness: true
  validates :category, :cooking_time, :party, presence: true
end
