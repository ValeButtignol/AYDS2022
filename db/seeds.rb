Group.create(name: "A")
Group.create(name: "B")
Group.create(name: "C")
Group.create(name: "D")
Group.create(name: "E")
Group.create(name: "F")
Group.create(name: "G")
Group.create(name: "H")
########################## GRUPO A
Team.create(name:"QATAR", group_id: 1, icon:"./public/team_icons/qatar.png")
Team.create(name:"ECUADOR", group_id: 1)
Team.create(name:"SENEGAL", group_id: 1)
Team.create(name:"PAÍSES BAJOS", group_id: 1)
########################## GRUPO B
Team.create(name:"INGLATERRA", group_id: 2)
Team.create(name:"IRAN", group_id: 2)
Team.create(name:"GALES", group_id: 2)
Team.create(name:"EE.UU.", group_id: 2)
########################## GRUPO C
Team.create(name:"ARGENTINA", group_id: 3)
Team.create(name:"ARABIA SAUDITA", group_id: 3)
Team.create(name:"MEXICO", group_id: 3)
Team.create(name:"POLONIA", group_id: 3)
########################## GRUPO D
Team.create(name:"FRANCIA", group_id: 4)
Team.create(name:"AUSTRALIA", group_id: 4)
Team.create(name:"DINAMARCA", group_id: 4)
Team.create(name:"TÚNEZ", group_id: 4)
########################## GRUPO E
Team.create(name:"ESPAÑA", group_id: 5)
Team.create(name:"COSTA RICA", group_id: 5)
Team.create(name:"ALEMANIA", group_id: 5)
Team.create(name:"JAPON", group_id: 5)
########################## GRUPO F
Team.create(name:"BÉLGICA", group_id: 6)
Team.create(name:"CANADÁ", group_id: 6)
Team.create(name:"MARRUECOS", group_id: 6)
Team.create(name:"CROACIA", group_id: 6)
########################## GRUPO G
Team.create(name:"BRASIL", group_id: 7)
Team.create(name:"SERBIA", group_id: 7)
Team.create(name:"SUIZA", group_id: 7)
Team.create(name:"CAMERÚN", group_id: 7)
########################## GRUPO H
Team.create(name:"PORTUGAL", group_id: 8)
Team.create(name:"GHANA", group_id: 8)
Team.create(name:"URUGUAY", group_id: 8)
Team.create(name:"COREA DEL SUR", group_id: 8)

####################################################
#Administrador

Administrator.create(username: "admin", password: "123")

####################################################
#Player
Player.create(username: "player", password: "123")
Player.create(username: "Joel", password: "123")
Player.create(username: "Joni", password: "123")
Player.create(username: "Joel", password: "123")
Player.create(username: "Vale", password: "123")
Player.create(username: "Mateo", password: "123")
Player.create(username: "Ignacio", password: "123")
Player.create(username: "Pablo", password: "123")
Player.create(username: "Lucio", password: "123")

####################################################
#match C

Match.create(stadium: "Estadio Lusail", date: "22/11/2022 07:00", home_team_id: 9, visitor_team_id: 10, match_type: "GROUP")
Match.create(stadium: "Estadio CIUDAD EDUCACION", date: "26/11/2022 10:00", home_team_id: 10, visitor_team_id: 12, match_type: "GROUP")
Match.create(stadium: "Estadio 974", date: "30/11/2022 16:00", home_team_id: 9, visitor_team_id: 12, match_type: "GROUP")
Match.create(stadium: "Estadio 974", date: "22/11/2022 13:00", home_team_id: 11, visitor_team_id: 12, match_type: "GROUP")
Match.create(stadium: "Estadio Lusail", date: "26/11/2022 16:00", home_team_id: 9, visitor_team_id: 11, match_type: "GROUP")
Match.create(stadium: "Estadio Lusail", date: "30/11/2022 16:00", home_team_id: 10, visitor_team_id: 11, match_type: "GROUP")

###################################################

#Octaves
Match.create(stadium: "A", date: "23/11/2022 07:00", home_team_id: 1, visitor_team_id: 9, match_type: "OCTAVES")
Match.create(stadium: "B", date: "24/11/2022 07:00", home_team_id: 2, visitor_team_id: 10, match_type: "OCTAVES")
Match.create(stadium: "C", date: "25/11/2022 07:00", home_team_id: 3, visitor_team_id: 11, match_type: "OCTAVES")
Match.create(stadium: "D", date: "26/11/2022 07:00", home_team_id: 4, visitor_team_id: 12, match_type: "OCTAVES")
Match.create(stadium: "E", date: "27/11/2022 07:00", home_team_id: 5, visitor_team_id: 13, match_type: "OCTAVES")
Match.create(stadium: "F", date: "28/11/2022 07:00", home_team_id: 6, visitor_team_id: 14, match_type: "OCTAVES")
Match.create(stadium: "G", date: "29/11/2022 07:00", home_team_id: 7, visitor_team_id: 15, match_type: "OCTAVES")
Match.create(stadium: "h", date: "30/11/2022 07:00", home_team_id: 8, visitor_team_id: 16, match_type: "OCTAVES")


###################################################

#Quarters
Match.create(stadium: "A", date: "23/11/2022 07:00", home_team_id: 1, visitor_team_id: 9, match_type: "QUARTERS")
Match.create(stadium: "B", date: "24/11/2022 07:00", home_team_id: 2, visitor_team_id: 10, match_type: "QUARTERS")
Match.create(stadium: "C", date: "25/11/2022 07:00", home_team_id: 3, visitor_team_id: 11, match_type: "QUARTERS")
Match.create(stadium: "D", date: "26/11/2022 07:00", home_team_id: 4, visitor_team_id: 12, match_type: "QUARTERS")

###################################################

#Semi
Match.create(stadium: "A", date: "23/11/2022 07:00", home_team_id: 1, visitor_team_id: 9, match_type: "SEMI")
Match.create(stadium: "B", date: "24/11/2022 07:00", home_team_id: 2, visitor_team_id: 10, match_type: "SEMI")

###################################################

#THIRD AND FOURTH
Match.create(stadium: "B", date: "24/11/2022 07:00", home_team_id: 2, visitor_team_id: 10, match_type: "THIRD AND FOURTH")

###################################################

#Final
Match.create(stadium: "A", date: "23/11/2022 07:00", home_team_id: 1, visitor_team_id: 9, match_type: "FINAL")

###################################################
