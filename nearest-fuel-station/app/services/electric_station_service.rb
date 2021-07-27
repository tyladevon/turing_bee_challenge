class ElectricStationService
  def initialize(location)
    @location = location
  end

	# https://developer.nrel.gov/api/alt-fuel-stations/v1.json?fuel_type=E85,ELEC&state=CA&limit=2&api_key=yMNTSAEAC2LiD9ZVkbRqeKMLg2K2O3djuKE5gtQx

	#   /api/alt-fuel-stations/v1/nearest.json?api_key=DEMO_KEY&location=1617+Cole+Blvd+Golden+CO&fuel_type=ELEC&limit=5

  def stations
		response = conn.get('/api/alt-fuel-stations/v1/nearest.json?api_key=yMNTSAEAC2LiD9ZVkbRqeKMLg2K2O3djuKE5gtQx&location=1617+Cole+Blvd+Golden+CO&fuel_type=ELEC&limit=5') do |req|
    end
    stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
    binding.pry
  end

  private

  def conn
    Faraday.new('https://developer.nrel.gov')
  end
end