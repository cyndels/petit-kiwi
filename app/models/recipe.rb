class Recipe < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :instructions, dependent: :destroy
  has_many :ingredients, through: :doses
  enum category: [:Aperitif, :Entree, :Plat, :Dessert, :Dejeuner]
end
