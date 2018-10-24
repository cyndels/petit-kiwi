class InstructionsController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @instructions = @recipe.instructions
    @instruction = Instruction.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @instruction = Instruction.new(instruction_params)
    @instruction.recipe = @recipe
    if @instruction.save
      redirect_to new_recipe_instruction_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @instruction = Instruction.find(params[:id])
    @instruction.destroy
    redirect_to new_recipe_instruction_path(@recipe)
  end

  private

  def instruction_params
    params.require(:instruction).permit(:content)
  end

end
