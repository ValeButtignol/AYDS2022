class Account < ActiveRecord::Base 

      #Class relations

      belongs_to :User
      belongs_to :Administrador

end