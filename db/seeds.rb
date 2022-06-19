Group.create(name: "A")
Group.create(name: "B")
Group.create(name: "C")
Group.create(name: "D")
Group.create(name: "E")
Group.create(name: "F")
Group.create(name: "G")
Group.create(name: "H")
########################## GRUPO A
Team.create(name:"QATAR", group_id: 1)
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
#match

Match.create(stadium: "Estadio Lusail", date: "22/11/2022 07:00", home_team_id: 9, visitor_team_id: 10, match_type: "GROUP")