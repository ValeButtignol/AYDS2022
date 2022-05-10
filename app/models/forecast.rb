class Forecast < ActiveRecord::Base
  belongs_to :player_user
  belongs_to :match
end