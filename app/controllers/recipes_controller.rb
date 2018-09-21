class RecipesController < ApplicationController

  def index
    if params[:category]
      @recipes = current_user.recipes.where(category: params[:category])
    else
      @recipes = current_user.recipes
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect to recipe_path(@recipe)
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :category, :cooking_time, :party, :instructions)
  end

end
