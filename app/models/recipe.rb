class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  enum category: [:Aperitif, :Entree, :Plat, :Dessert, :Dejeuner]
end
