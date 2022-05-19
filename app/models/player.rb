class Player < ActiveRecord::Base
  
  has_many :forecasts

  # Callback that sets the player points at zero, when it is created.
  before_create do
    self.points = 0
  end
end