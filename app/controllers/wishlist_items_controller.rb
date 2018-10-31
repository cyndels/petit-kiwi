class WishlistItemsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @wishlist_item = WishlistItem.new
    @wishlist = Wishlist.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @wishlist_item = WishlistItem.new(wishlist_item_params)
    @wishlist_item.recipe = @recipe
    if @wishlist_item.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    # @wishlist_item = WishlistItem.find(params[:id])
    # @wishlist_item.destroy
    # redirect_to wishlists_path
  end

  private

  def wishlist_item_params
    params.require(:wishlist_item).permit(:wishlist_id, :recipe_id)
  end
end
