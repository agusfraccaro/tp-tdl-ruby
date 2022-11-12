class CookpediaController < ApplicationController
  before_action :require_login
  def index
    @recipes = Recipe.all
  end
end
