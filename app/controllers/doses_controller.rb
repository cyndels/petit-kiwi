class DosesController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @doses = @recipe.doses
  end

  def new
    @ingredients = Ingredient.all
    @recipe = Recipe.find(params[:recipe_id])
    @dose = Dose.new
    @ingredient = Ingredient.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.recipe = Recipe.find(params[:recipe_id])
    @dose.ingredient = Ingredient.find(dose_params[:ingredient_id])
    @dose.save
  end

  private

  def dose_params
    params.require(:dose).permit(:unit, :quantity)
  end
end
