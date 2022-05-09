 class Player_User < ActiviRecord::Base 

    belongs_to :User
    has_many :Bet

end