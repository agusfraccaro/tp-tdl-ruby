class RecipeController < ApplicationController
  before_action :require_login
  def index
    @recipes = Actual.user.recipes
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Actual.user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to cookpedia_path, notice: "Receta creada satisfactoriamente"
    else
      render :new
    end
  end

  def show
  end

  private

  def recipe_params
    params.require(:recipe).permit(:nombre, :descripcion, :image, :user_id)
  end
end
