require_relative '../app/models/init.rb'

describe 'User' do 
    describe 'when the input is epmpty for username' do
        it 'No is valid' do

        user = User.new(username: nil)

        expect(user.valid?).to be(false) 

        end
    end
    describe 'when the input is epmpty for email' do
        it 'No is valid' do

        user = User.new(email: nil)

        expect(user.valid?).to be(false) 

        end
    end
    describe 'when the input is epmpty for password' do
        it 'No is valid' do

        user = User.new(password: nil)

        expect(user.valid?).to be(false) 

        end
    end
end


