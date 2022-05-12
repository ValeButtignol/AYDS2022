require_relative '../app/models/init.rb'

describe 'Team' do 
    describe 'when input is empty' do
        it 'It is not valid' do
            
            team = Team.new(name: nil)
            
            expect(team.valid?).to be(false)

        end

    end

    describe 'when the teams are equals' do
        it'It is not valid' do
            
            team1 = Team.new(name: "River")
            team2 = Team.new(name: "Boca")

            expect(team1).not_to eq(team2)
        
        end
    
    end

end