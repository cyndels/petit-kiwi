class IngredientsController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to new_recipe_dose_path(@recipe)
    else
      render :new
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
