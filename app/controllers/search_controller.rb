class SearchController < ApplicationController
  before_action :require_login
  
  def index
    @query = Recipe.ransack(params[:q])
    @recipes = @query.result(distinct: true)
  end
end
