class SearchController < ApplicationController
  def index
    @location = params["location"]
    stations = ElectricStation.new(@location).call_station
    render locals: {
      electric_stations: stations
    }
  end
end
