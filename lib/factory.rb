class Factory

    def initialize
    end

    def create_vehicles(cars)

        cars.map do |car|
            Vehicle.new(
            vin: car[:vin_1_10],
            year: car[:model_year].to_i,
            make: car[:make],
            model: car[:model],
            engine: :ev
             )
        end
    end
end
