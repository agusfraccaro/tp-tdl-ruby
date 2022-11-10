class RecipeController < ApplicationController
  before_action :require_login
  before_action :set_receta, only: [:edit, :update, :destroy]

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

  def edit
    @id = params[:id]
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to cookpedia_path, notice: 'Receta actualizada correctamente.'
    else
      render :new, notice: 'Hubo un error al editar la receta.'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to cookpedia_path, notice: "Receta eliminada satisfactoriamente"
  end

  private

  def recipe_params
    params.require(:recipe).permit(:nombre, :descripcion, :image, :user_id)
  end

  def set_receta
    @recipe = Actual.user.recipes.find_by(id: params[:id])
  end
end
