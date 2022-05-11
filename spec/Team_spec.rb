require_relative '../app/models/team.rb'

describe 'Team' do 
    describe 'when input is empty' do
        it 'It is not valid' do
            
            team = Team.new(name: nil)
            
            expect(team.valid?).to be(false)

        end

    end

end