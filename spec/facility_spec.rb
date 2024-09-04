require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end


  describe '#register vehicle' do
    it 'can register new vehicles' do
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @facility.add_service('Vehicle Registration')

      
      @facility.register_vehicle(@cruz)

      expect(@facility.registered_vehicles).to eq [@cruz]

      expect(@facility.collected_fees).to eq 100


    end
  end

  describe '#register other vehicles' do
    it 'can register new old vehicles' do
      @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      @facility.add_service('Vehicle Registration')

      
      @facility.register_vehicle(@camaro)
     
      @facility.register_vehicle(@bolt)

      expect(@facility.registered_vehicles).to eq [@camaro, @bolt]

      expect(@facility.collected_fees).to eq 225


      expect(@bolt.plate_type).to eq :ev
      expect(@camaro.plate_type).to eq :antique


    end
  end
    describe '#date registered' do
    it 'can give registration date' do
      @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(@camaro)

      expect(@camaro.registration_date).to eq (Date.today)
    end
  end


    describe '#written test' do
    it 'can administer written test' do 
      @registrant_1 = Registrant.new('Bruce', 18, true )
      @facility.add_service('Written test')

      @facility.administer_written_test(@registrant_1)

      expect(@registrant_1.license_data).to eq ({:written=>true, :license=>false, :renewed=>false})
    end
  end

    describe '#road tested' do
    it 'can administer road test' do
      @registrant_1 = Registrant.new('Bruce', 18, true )
      @registrant_2 = Registrant.new('Penny', 15 )

      @facility.add_service("Road test")

      @facility.administer_road_test(@registrant_1)
      @facility.administer_road_test(@registrant_2)
      expect(@registrant_1.license_data).to eq ({:written=>false, :license=>true, :renewed=>false})
      expect(@registrant_2.license_data).to eq ({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe '#renew license' do
  it 'can renew license' do 
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @facility.add_service('License renew')
    @facility.add_service('Road test')

    @facility.administer_road_test(@registrant_1)
    @facility.renew_license(@registrant_1)

    expect(@registrant_1.license_data).to eq ({:written=>false, :license=>true, :renewed=>true})
  end
end
end
