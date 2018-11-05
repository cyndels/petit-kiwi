class RenameWishlistItemsToItems < ActiveRecord::Migration[5.2]
  def change
    rename_table :items, :items
  end
end
