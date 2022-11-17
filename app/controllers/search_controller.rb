class SearchController < ApplicationController
  def index
    @query = Recipe.ransack(params[:q])
    @recipes = @query.result(distinct: true)
  end
end
