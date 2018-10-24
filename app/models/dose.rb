class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
  enum unit: [:piece, :g, :kg, :ml, :cl, :l, :cas, :cac]
end
