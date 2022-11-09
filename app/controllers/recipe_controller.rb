class RecipeController < ApplicationController
  def index
    @recipes = Actual.user.recipes
  end

  def new
    @recipe = Recipe.new
  end

  def create

  end

  def show
  end

  private

  def recipe_params
    params.require(:recipe).permit(:nombre, :descripcion, :user, :imagen)
  end
end
