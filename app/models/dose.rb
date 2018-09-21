class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe, optional: true
  enum unit: [:piece, :g, :kg, :ml, :cl, :l]
end
