class CookpediaController < ApplicationController
  def index
    @recipes = Recipe.all
  end
end
