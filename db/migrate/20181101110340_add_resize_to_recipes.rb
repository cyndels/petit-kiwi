class AddResizeToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :resize, :integer
  end
end
