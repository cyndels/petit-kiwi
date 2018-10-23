class DosesController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @doses = @recipe.doses
    @dose = Dose.new
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @dose = Dose.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @dose = Dose.new(dose_params)
    @dose.recipe = @recipe
    if @dose.save
      redirect_to recipe_doses_path(@recipe)
    else
      render :new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:unit, :quantity, :ingredient_id)
  end
end
