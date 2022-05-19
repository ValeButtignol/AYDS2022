class Forecast < ActiveRecord::Base
  belongs_to :player
  belongs_to :match

  # Callback that sets forcast.winner automaticly.
  before_create do
    self.winner = set_winner(self.home_goals, self.visitor_goals) 
  end

  # Consult: In which other way can we do this?
  after_create do
    f = Forecast.find_by(player: self.player, match: self.match) 
    if f.player == self.player and f.match == self.match then
      self.destroy
    end
  end


  # Consult: Should we create a class for the public methods?
  def set_winner(home_goals, visitor_goals)
    if home_goals > visitor_goals
      "home"
    elsif home_goals < visitor_goals
      "visitor"
    else 
      "draw"
    end
  end

end