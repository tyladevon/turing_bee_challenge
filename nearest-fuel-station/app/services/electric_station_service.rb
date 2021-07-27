class ElectricStationService
  def initialize(location)
    @location = location
  end

  def stations
    response = conn.get('/api/alt-fuel-stations/v1/nearest.json?') do |req|
      req.params['api_key'] = ENV['ELEC_STATION']
      req.params['location'] = @location
      req.params['access'] = 'public'
      req.params['fuel_type'] = 'ELEC'
      req.params['limit'] = 5
    end
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  private

  def conn
    Faraday.new('https://developer.nrel.gov')
  end
end