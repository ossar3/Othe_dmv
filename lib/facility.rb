class Facility
  attr_reader :name, :address, :phone, :services

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

  

  def register_vehicle(vehicle)
#check if it has the service? IF
  @registered_vehicles << vehicle
  if vehicle.antique? == true
    vehicle.plate_type = :antique
    #if vehicle antique collect 25 else collect 100?
    #set date
  end
  end


  def


end
