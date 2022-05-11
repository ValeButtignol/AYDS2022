require_relative '../app/models/forecast.rb'

describe 'Forecast' do 
    describe 'when the number is negative for the home' do
        it 'It is not valid' do
            
            f = Forecast.new(home_goals: 4)

            expect(f.home_goals()).to be > 0
        end

    end

    describe 'when the number is negative for the visitor' do
        it 'It is not valid' do

        f = Forecast.new(visitor_goals: 3)
        expect(f.visitor_goals()).to be > 0
        
        end
    end   
end