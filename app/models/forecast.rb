class Forecast < ActiveRecord::Base
  belongs_to :player
  belongs_to :match

  validates :home_goals, :visitor_goals, :player, :match, presence: true

  # Callback that sets forcast.winner automaticly.
  before_create do
    self.winner = set_winner(self.home_goals, self.visitor_goals) 
  end

  before_create do
    if self.match.result
      self.delete
    end
  end

  after_create do
    f = Forecast.find_by(player: self.player, match: self.match) 
    if f.player == self.player and f.match == self.match and f.id != self.id then
      self.delete
    end
  end

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