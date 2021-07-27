class Station
	attr_reader :name, :address, :fuel_type, :access_times
	def initialize(info)
		@name = info[:name]
		@address = info[:address]
		@fuel_type = info[:fuel_type]
		@access_times = info[:access_times]
	end
end