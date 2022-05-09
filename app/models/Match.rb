class Match < ActiveRecord::Base

      #Class relations

      has_one :Bet
      has_one :Result
      has_one :home, class_name: 'Team'
      has_one :visitor, class_name: 'Team'
      has_many :Administrador
      

end