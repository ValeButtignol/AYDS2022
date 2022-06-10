class Result < ActiveRecord::Base
  belongs_to :match
  has_many :administrators

  validates :home_goals, :visitor_goals, :match, presence: true

  # Callback that sets result.winner automaticly.
  before_create do
    self.winner = set_winner(self.home_goals, self.visitor_goals) 
  end
  
    # Callback that sets the points of the players automaticly.
  before_create do
    self.match.forecasts.each do |f|
      set_points(self, f)
    end
  end

  before_create do
    set_won_matches(self.match)
  end

  after_create do
    r = Result.find_by(match: self.match)
    if r.match == self.match and r.id != self.id then
      self.delete
    end
  end

  # Function that calculates the winner.
  def set_points(result, forecast)
    if result.winner == forecast.winner then
      forecast.player.update(points: forecast.player.points + 2)
      if result.home_goals == forecast.home_goals and result.visitor_goals == forecast.visitor_goals then
        forecast.player.update(points: forecast.player.points + 1)
      end
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

  def set_won_matches(match)
    if match.match_type == "GROUP"
      if match.result.winner == "home"
        match.home_team.update(points_of_group: match.home_team.points_of_group + 3)
      elsif match.result.winner == "visitor"
        match.visitor_team.update(points_of_group: match.visitor_team.points_of_group + 3)
      else
        match.home_team.update(points_of_group: match.home_team.points_of_group + 1)
        match.visitor_team.update(points_of_group: match.visitor_team.points_of_group + 1)
      end
    end
  end
end
