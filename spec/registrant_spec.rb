# require 'pry';binding.pry
require 'spec_helper'

RSpec.describe Registrant do
    before(:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true )
      @registrant_2 = Registrant.new('Penny', 15 )
    end

    describe '#initialize' do
        it 'can do initialize' do
            expect(@registrant_1).to be_an_instance_of(Registrant)
            expect(@registrant_2).to be_an_instance_of(Registrant)
            expect(@registrant_1.name).to eq 'Bruce'
            expect(@registrant_1.age).to be 18
            expect(@registrant_1.permit?).to be true
            expect(@registrant_2.name).to eq 'Penny'
            expect(@registrant_2.age).to be 15
            expect(@registrant_2.permit?).to be false
        end
    end



    describe '#earn_permit' do
        it 'can earn a permit' do
            @registrant_1.earn_permit

            expect(@registrant_1.permit?).to be true
        end
    end
end