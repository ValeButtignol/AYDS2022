class Result < ActiveRecord::Base

    #Class relations

    has_one :Match
    has_many :Administrador
    
 end