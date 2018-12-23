class Ingredient < ApplicationRecord
  belongs_to :recipe
  validates :name, presence: true

  enum unit: [:kg, :g, :l, :cl, :ml]
end
