class WishlistsController < ApplicationController
  def index
    @wishlists = current_user.wishlists
  end

  def show
    @wishlist = Wishlist.find(params[:id])
  end

  def new
    @wishlist = Wishlist.new
  end

  def create
    @wishlist = Wishlist.new(wishlist_params)
    @wishlist.user = current_user
    if @wishlist.save
      redirect_to wishlists_path
    else
      render :new
    end
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:name)
  end

end
