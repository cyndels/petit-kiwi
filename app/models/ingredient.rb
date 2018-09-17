class Ingredient < ApplicationRecord
  belongs_to :recipe
  enum unit: [ :piece, :ml, :cl, :g, :kg ]
end
