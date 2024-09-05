require 'spec_helper'

RSpec.describe Factory do 

    describe '#initialize' do
        it 'can make factory' do

            factory = Factory.new

            expect(factory).to be_an_instance_of(Factory)
        end
    end

    describe 'create' do
        it 'can create vehicles' do
            factory = Factory.new
            wa_ev_registrations = DmvDataService.new.wa_ev_registrations

          vehicles = factory.create_vehicles(wa_ev_registrations)
          expect(vehicles).to be_an(Array)
            expect(vehicles).to all(be_a(Vehicle))
        end
    end

end