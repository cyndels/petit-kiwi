class RecipesController < ApplicationController

  def index
    @recipes = current_user.recipes.where(category: params[:category])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to new_recipe_dose_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to dashboard_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :category, :cooking_time, :party, :instructions)
  end

end
