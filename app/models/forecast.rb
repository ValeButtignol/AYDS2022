class Forecast < ActiveRecord::Base
  belongs_to :player
  belongs_to :match

  validates :home_goals, :visitor_goals, :player, :match, presence: true

  # Callback that sets forcast.winner automaticly.
  before_create do
    self.winner = set_winner(home_goals, visitor_goals)
  end

  before_create do
    delete if match.result
  end

  after_create do
    f = Forecast.find_by(player: player, match: match)
    if f.player == player and f.match == match and f.id != id
      delete
      f.player.update(forecasts_made: f.player.forecasts_made - 1)
    end
  end

  after_create do
    player.update(forecasts_made: player.forecasts_made + 1)
  end

  def set_winner(home_goals, visitor_goals)
    if home_goals > visitor_goals
      'home'
    elsif home_goals < visitor_goals
      'visitor'
    else
      'draw'
    end
  end
end
