class ElectricStation
	def	initialize(location)
		@location = location
	end

	def call_station
		available_stations = ElectricStationService.new(@location).stations
		 available_stations.map do |station|
			binding.pry
			info = {name: station[:station_name], 
								address: {address: station[:address],
													city: station[:city],
													zip: station[:zip],
													country: station[:country]},
								fuel_type: station[:fuel_type_code],
								access_times: station[:access_days_times]}
			Station.new(info)
		end
	end
end