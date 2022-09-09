require_relative '../app/models/init'

describe 'Player' do 

    user_1 = Player.create(username: "Ignacio", password: "123")
    user_2 = Player.create(username: "Jose", password: "321")
    user_3 = Player.create()
    user_4 = Player.new()

    admin = Administrator.create()
    
    a = Group.create(name: "A")
    b = Group.create(name: "B")
    c = Group.create(name: "C")
    d = Group.create(name: "D")
    e = Group.create(name: "E")
    f = Group.create(name: "F")
    g = Group.create(name: "G")
    h = Group.create(name: "H")
    ########################## GRUPO A
    qatar =Team.create(name:"QATAR", group_id: 1)
    ecuador = Team.create(name:"ECUADOR", group_id: 1)
    senegal = Team.create(name:"SENEGAL", group_id: 1)
    paisesBajos = Team.create(name:"PAÍSES BAJOS", group_id: 1)
    ########################## GRUPO B
    inglaterra = Team.create(name:"INGLATERRA", group_id: 2)
    iran = Team.create(name:"IRAN", group_id: 2)
    gales = Team.create(name:"GALES", group_id: 2)
    estadosUnidos = Team.create(name:"EE.UU.", group_id: 2)
    ########################## GRUPO C
    argentina = Team.create(name:"ARGENTINA", group_id: 3)
    arabiaSaudita = Team.create(name:"ARABIA SAUDITA", group_id: 3)
    mexico = Team.create(name:"MEXICO", group_id: 3)
    polonia = Team.create(name:"POLONIA", group_id: 3)
    ########################## GRUPO D
    francia = Team.create(name:"FRANCIA", group_id: 4)
    australia = Team.create(name:"AUSTRALIA", group_id: 4)
    dinamarca = Team.create(name:"DINAMARCA", group_id: 4)
    tunez = Team.create(name:"TÚNEZ", group_id: 4)
    ########################## GRUPO E
    españa = Team.create(name:"ESPAÑA", group_id: 5)
    costaRica = Team.create(name:"COSTA RICA", group_id: 5)
    alemania = Team.create(name:"ALEMANIA", group_id: 5)
    japon = Team.create(name:"JAPON", group_id: 5)
    ########################## GRUPO F
    belgica = Team.create(name:"BÉLGICA", group_id: 6)
    canada = Team.create(name:"CANADÁ", group_id: 6)
    marruecos = Team.create(name:"MARRUECOS", group_id: 6)
    croacia = Team.create(name:"CROACIA", group_id: 6)
    ########################## GRUPO G
    brasil = Team.create(name:"BRASIL", group_id: 7)
    serbia = Team.create(name:"SERBIA", group_id: 7)
    suiza = Team.create(name:"SUIZA", group_id: 7)
    camerun = Team.create(name:"CAMERÚN", group_id: 7)
    ########################## GRUPO H
    portugal = Team.create(name:"PORTUGAL", group_id: 8)
    ghana = Team.create(name:"GHANA", group_id: 8)
    uruguay = Team.create(name:"URUGUAY", group_id: 8)
    corea = Team.create(name:"COREA DEL SUR", group_id: 8)
    
    ####################################################
    #Administrador
    
    admin = Administrator.create(username: "admin", password: "123")
    
    ####################################################
    #match C
    
    partido1 = Match.create(stadium: "Estadio Lusail", date: "22/11/2022 07:00", home_team_id: 9, visitor_team_id: 10, match_type: "GROUP")
    partido2 = Match.create(stadium: "Estadio CIUDAD EDUCACION", date: "26/11/2022 10:00", home_team_id: 10, visitor_team_id: 12, match_type: "GROUP")
    partido3 = Match.create(stadium: "Estadio 974", date: "30/11/2022 16:00", home_team_id: 9, visitor_team_id: 12, match_type: "GROUP")
    partido4 = Match.create(stadium: "Estadio 974", date: "22/11/2022 13:00", home_team_id: 11, visitor_team_id: 12, match_type: "GROUP")
    partido5 = Match.create(stadium: "Estadio Lusail", date: "26/11/2022 16:00", home_team_id: 9, visitor_team_id: 11, match_type: "GROUP")
    partido6 = Match.create(stadium: "Estadio Lusail", date: "30/11/2022 16:00", home_team_id: 10, visitor_team_id: 11, match_type: "GROUP")
    
    ###################################################
    
    #Octaves
    octavo1 = Match.create(stadium: "A", date: "23/11/2022 07:00", home_team_id: 1, visitor_team_id: 9, match_type: "OCTAVES")
    octavo2 = Match.create(stadium: "B", date: "24/11/2022 07:00", home_team_id: 2, visitor_team_id: 10, match_type: "OCTAVES")
    octavo3 = Match.create(stadium: "C", date: "25/11/2022 07:00", home_team_id: 3, visitor_team_id: 11, match_type: "OCTAVES")
    octavo4 = Match.create(stadium: "D", date: "26/11/2022 07:00", home_team_id: 4, visitor_team_id: 12, match_type: "OCTAVES")
    octavo5 = Match.create(stadium: "E", date: "27/11/2022 07:00", home_team_id: 5, visitor_team_id: 13, match_type: "OCTAVES")
    octavo6 = Match.create(stadium: "F", date: "28/11/2022 07:00", home_team_id: 6, visitor_team_id: 14, match_type: "OCTAVES")
    octavo7 = Match.create(stadium: "G", date: "29/11/2022 07:00", home_team_id: 7, visitor_team_id: 15, match_type: "OCTAVES")
    octavo8 = Match.create(stadium: "h", date: "30/11/2022 07:00", home_team_id: 8, visitor_team_id: 16, match_type: "OCTAVES")
    
    
    ###################################################
    
    #Quarters
    quarter1 = Match.create(stadium: "A", date: "23/11/2022 07:00", home_team_id: 1, visitor_team_id: 9, match_type: "QUARTERS")
    quarter2 = Match.create(stadium: "B", date: "24/11/2022 07:00", home_team_id: 2, visitor_team_id: 10, match_type: "QUARTERS")
    quarter3 = Match.create(stadium: "C", date: "25/11/2022 07:00", home_team_id: 3, visitor_team_id: 11, match_type: "QUARTERS")
    quarter4 = Match.create(stadium: "D", date: "26/11/2022 07:00", home_team_id: 4, visitor_team_id: 12, match_type: "QUARTERS")
    
    ###################################################
    
    #Semi
    semi1 = Match.create(stadium: "A", date: "23/11/2022 07:00", home_team_id: 1, visitor_team_id: 9, match_type: "SEMI")
    semi2 = Match.create(stadium: "B", date: "24/11/2022 07:00", home_team_id: 2, visitor_team_id: 10, match_type: "SEMI")
    
    ###################################################
    
    #THIRD AND FOURTH
    third = Match.create(stadium: "B", date: "24/11/2022 07:00", home_team_id: 2, visitor_team_id: 10, match_type: "THIRD AND FOURTH")
    
    ###################################################
    
    #Final
    final = Match.create(stadium: "A", date: "23/11/2022 07:00", home_team_id: 1, visitor_team_id: 9, match_type: "FINAL")
    
    ###################################################
    #Forecast 

    forecast1 = Forecast.create(home_goals: 2, visitor_goals: 3, match_id: partido1.id, player_id: user_1.id)
    forecast2 = Forecast.create(home_goals: 1, visitor_goals: -3, match_id: 2)


    ###################################################
    
    #######################Players#####################
    describe 'when two player have different username and the same username' do
        it 'Is valid' do
            expect(user_1.username).not_to eq(user_2.username) 
        end
    end

    describe 'when the user save the name' do
        it 'Is valid' do
            expect(user_1.username).not_to be_nil
        end

        it 'Is not valid' do
            expect(user_3.username).to be_nil
        end
    end

    describe 'If each player is a user' do
        it 'Is valid' do
            expect([user_1,user_2,user_3]).to all(be_an(Player))
        end
    end

    describe 'If each element of the array is a user' do

        it 'Is valid' do
            expect([user_1,user_2,user_3]).to contain_exactly(user_1,user_3,user_2)

        end

        it 'Is not valid' do
            expect([user_1,user_2,user_3]).not_to contain_exactly(user_1,user_3)
        end

        it 'Is not valid' do
            expect([user_1,user_2,user_3]).not_to contain_exactly(user_1,admin)
        end

    end

    describe 'If the player username is spelled correctly' do

        it 'Is valid' do
            expect(user_1).to have_attributes(:username => "Ignacio")
        end

        it 'Is not valid' do
            expect(user_2).not_to have_attributes(:username => "Ignacio")
        end
    end

    #######################Forecast#####################
    describe "Load the forecasts and don't have repeated ones for the same match" do
        
        forecast3 = Forecast.create(home_goals: 2, visitor_goals: 3, match_id: partido1.id, player_id: user_1.id)

        it  'Is valid' do
            expect(forecast1).to be_a(Forecast)
        end
        
        it 'Is not valid' do
            expect(forecast3.player_id).to eq(forecast1.player_id)
            expect(forecast3.match_id).to eq(forecast1.match_id)
        end
    end

    describe 'Check that goals are positive' do

        it 'Is valid' do
            expect(forecast1.home_goals).to be >= 0
            expect(forecast1.visitor_goals).to be >= 0
        end

        it 'Is not valid' do
            expect(forecast2.visitor_goals).to be <= 0
        end

        it 'Is valid' do
            expect([forecast1.home_goals,forecast1.visitor_goals]).to all(be_an(Integer))
        end

    end

    #######################Matches#####################
    describe 'If the atributes of the match are spelled correctly' do

        it 'Is valid' do
            expect(partido1).to have_attributes(:stadium => "Estadio Lusail")
            expect(partido1).to have_attributes(:match_type => "GROUP")
            expect(partido1).to have_attributes(:home_team_id => 9)
            expect(partido1).to have_attributes(:visitor_team_id => 10)
        end
    end

    #######################Teams#####################

    describe 'If the atributes of the match are spelled correctly' do

        it 'Is valid' do
            expect(argentina).to have_attributes(:name => argentina.name)
        end
    end

    #######################Groups#####################
    describe 'If all elements of the array are Groups' do

        it 'Is valid' do
            expect([a,b,c,d,e,f,g,h]).to all(be_an(Group))
        end
    end

    describe 'If each group is well written' do

        it 'Is valid' do
            expect(a.name).to end_with "A"
            expect(b.name).to end_with "B"
            expect(c.name).to end_with "C"
            expect(d.name).to end_with "D"
            expect(e.name).to end_with "E"
            expect(f.name).to end_with "F"
            expect(g.name).to end_with "G"
            expect(h.name).to end_with "H"
        end
    end

    describe 'If the array is sorted' do

        it 'Is valid' do
            expect([a,b,c,d,e,f,g,h]).to end_with g,h
        end

        it 'Is not valid' do
            expect([a,b,c,d,e,f,g,h]).not_to end_with g,d
        end

        it 'Is valid' do
            expect([a,b,c,d,e,f,g,h]).to start_with(a, b)
        end

        it 'Is not valid' do
            expect([a,b,c,d,e,f,g,h]).not_to start_with(b)
        end
    end
end