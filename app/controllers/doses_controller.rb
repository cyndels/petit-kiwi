class DosesController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @doses = @recipe.doses
    @dose = Dose.new
    @ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @dose = Dose.new(dose_params)
    @dose.recipe = @recipe
    if @dose.save
      redirect_to new_recipe_dose_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to new_recipe_dose_path(@recipe)
  end

  private

  def dose_params
    params.require(:dose).permit(:unit, :quantity, :ingredient_id)
  end
end
