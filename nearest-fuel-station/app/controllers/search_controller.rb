class SearchController < ApplicationController
  def index
    @electric_stations = ElectricStationService.new(params["location"]).stations
  end
end
