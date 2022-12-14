require 'uri'
require 'net/http'
require 'json'

class RecipeController < ApplicationController
  before_action :require_login
  before_action :set_receta, only: [:edit, :update, :destroy]



  def index
    @recipes = Actual.user.recipes

    uri_random_product = URI('https://robotoff.openfoodfacts.org/api/v1/questions/random?lang=es&count=1')
    res = Net::HTTP.get_response(uri_random_product)
    @random_product  = res.is_a?(Net::HTTPSuccess) ? JSON.parse(res.body)["questions"][0] : "No se encontro un producto"
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Actual.user.recipes.new(recipe_params.except(:tags))
    create_or_delete_recipe_tags(@recipe, params[:recipe][:tags])
    if @recipe.save
      redirect_to cookpedia_path, notice: "Receta creada satisfactoriamente"
    else
      render :new
    end
  end

  def edit
  end

  def update
    create_or_delete_recipe_tags(@recipe, params[:recipe][:tags])
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

  def like
    @recipe = Recipe.all.find_by(id: params[:id])
    @like = Like.create(user_id: Actual.user.id, recipe_id: @recipe.id)
    if @like.save
        redirect_to recipe_path(@like.recipe_id)
    else
        redirect_to recipe_path(@like.recipe_id), alert: "Hubo un error al likear la receta."
    end
  end

  def unlike
    @like = Actual.user.likes.find_by(id: params[:id])
    @recipe = Recipe.all.find_by(id: @like.recipe_id)
    @like.destroy
    redirect_to recipe_path(@recipe)
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
