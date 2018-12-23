class IngredientsController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = @recipe.ingredients
    @ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.recipe = @recipe
    if @ingredient.save
      redirect_to new_recipe_ingredient_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to new_recipe_ingredient_path(@recipe)
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :unit, :quantity)
  end

end
