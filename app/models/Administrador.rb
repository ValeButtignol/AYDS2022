class Administrador < ActiveRecord::Base

      #Class relations
      
      has_many :Match
      has_many :Result
      belongs_to :Account

end