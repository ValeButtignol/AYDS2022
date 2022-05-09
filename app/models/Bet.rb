 class Bet < ActiveRecord::Base

   #Class relations

   has_one :User
   has_one :Match 
 
 end   