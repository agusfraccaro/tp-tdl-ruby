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
    @recipe = Actual.user.recipes.new(recipe_params.except(:tags))
    create_or_delete_recipe_tags(@recipe, params[:recipe][:tag])
    if @recipe.save
      redirect_to cookpedia_path, notice: "Receta creada satisfactoriamente"
    else
      render :new
    end
  end

  def edit
  end

  def update
    create_or_delete_recipe_tags(@recipe, params[:recipe][:tag])
    if @recipe.update(recipe_params.except(:tags))
      redirect_to cookpedia_path, notice: 'Receta actualizada correctamente.'
    else
      render :new, notice: 'Hubo un error al editar la receta.'
    end
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def destroy
    @recipe.destroy
    redirect_to cookpedia_path, notice: "Receta eliminada satisfactoriamente"
  end

  private

  def create_or_delete_recipe_tags(recipe, tags)
    recipe.taggables.destroy_all
    tags = tags.strip.split(',')
    tags.each do |tag|
      recipe.tags << Tag.find_or_create_by(name: tag)
    end
  end
  def recipe_params
    params.require(:recipe).permit(:nombre, :content, :image, :user_id, :tags)
  end

  def set_receta
    @recipe = Actual.user.recipes.find_by(id: params[:id])
  end
end
