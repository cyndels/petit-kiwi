class ItemsController < ApplicationController

  def index
    @wishlist = Wishlist.find(params[:wishlist_id])
    @items = @wishlist.items
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @item = Item.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @item = Item.new(item_params)
    @item.recipe = @recipe
    if @item.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to wishlists_path
  end

  private

  def item_params
    params.require(:item).permit(:wishlist_id)
  end
end
