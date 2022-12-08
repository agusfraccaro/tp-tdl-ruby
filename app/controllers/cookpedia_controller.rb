require 'uri'
require 'net/http'
require 'json'

class CookpediaController < ApplicationController
  before_action :require_login
  def index
    @recipes = Recipe.all

    uri = URI('https://date.nager.at/api/v3/NextPublicHolidays/AR')
    res = Net::HTTP.get_response(uri)
    @next_holiday  = res.is_a?(Net::HTTPSuccess) ? JSON.parse(res.body)[0] : "No hay eventos proximos"
  end
end
