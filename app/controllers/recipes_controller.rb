class RecipesController < ApplicationController

  def index
    @recipes = current_user.recipes.where(category: params[:category])
  end

  def show
    @recipe = Recipe.find(params[:id])
    @item = Item.new
    if @recipe.resize != nil && @recipe.resize != @recipe.party
      @recipe.ingredients.each do |ingredient|
        if ingredient.quantity != nil
          ingredient.quantity = ((ingredient.quantity.to_f/@recipe.party)*@recipe.resize).ceil
        end
      end
      @recipe.party = @recipe.resize
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to new_recipe_ingredient_path(@recipe)
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def resize
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.update(resize: :resize)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to dashboard_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :category, :cooking_time, :party, :instructions, :resize)
  end

end
