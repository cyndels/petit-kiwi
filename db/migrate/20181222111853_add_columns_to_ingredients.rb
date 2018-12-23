class AddColumnsToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :quantity, :integer
    add_column :ingredients, :unit, :integer
    add_reference :ingredients, :recipe, foreign_key: true
  end
end
