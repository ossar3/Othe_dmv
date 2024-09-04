class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees, :registered_vehicles

  def initialize(facility)
   
    @name = facility[:name]
    @address = facility[:address]
    @phone = facility[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def log_vehicle(vehicle)
    @registered_vehicles << vehicle
  end

  def update_registration(vehicle)
   

    vehicle.registration_date = Date.today
  end

  def plate_service(vehicle)
    #if it is antique
    if vehicle.antique?
      then @collected_fees += 25
      vehicle.plate_type = :antique
      #collect 25 and  update value += 
      #give antique plate
     #elsif electric run 
    elsif vehicle.electric_vehicle?
      then @collected_fees += 200
      vehicle.plate_type = :ev
      #collect 200
      #give ev plate
    else
      @collected_fees += 100
      vehicle.plate_type = :regular
      # collect 100
      # plate type regular
    end
  end

  def register_vehicle(vehicle)
  #check if it has the service? IF
    if @services.include?("Vehicle Registration")
     log_vehicle(vehicle)
     update_registration(vehicle)
     plate_service(vehicle)
      
      #update vehicle helper metyhod regiustration for that instance
      #plate service helper method assign and collect money
    end
  end

  #  @registered_vehicles << vehicle
  #   if vehicle.antique? == true
  #     vehicle.plate_type = :antique
  #   elsif vehicle.engine == "ev"
  #    vehicle.plate_type = :ev
  #   end
  #   if vehicle.antique? == true 
  #    (@collected_fees) + 25
  #  else 
  #    (@collected_fees) + 100
  #  end
  #if vehicle antique collect 25 else collect 100?
    #set date
  #  end
  #   end
  # end

  def administer_written_test(registrant)
    if @services.include?("Written test")
      registrant.license_data[:written] = true
  end
end

    def administer_road_test(registrant)
      if @services.include?("Road test") && registrant.age >= 16
        registrant.license_data[:license] = true
      end
    end


    def renew_license(registrant)
      if @services.include?("License renew") && registrant.license_data[:license] = true
        registrant.license_data[:renewed] = true
      end
    end
end

