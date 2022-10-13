class Result < ActiveRecord::Base
  belongs_to :match
  has_many :administrators

  validates :home_goals, :visitor_goals, :match, presence: true

  # Callback that sets result.winner automaticly.
  before_create do
    self.winner = set_winner(home_goals, visitor_goals)
  end

  # Callback that sets the points of the players automaticly.
  before_create do
    match.forecasts.each do |f|
      set_points(self, f)
    end
  end

  before_create do
    set_won_matches(match)
  end

  after_create do
    r = Result.find_by(match: match)
    delete if r.match == match and r.id != id
  end

  # Function that calculates the winner.
  # rubocop:disable Metrics/AbcSize
  def set_points(result, forecast)
    if result.winner == forecast.winner
      forecast.player.update(points: forecast.player.points + 2,
                             forecasts_half_hit: forecast.player.forecasts_half_hit + 1)
      if result.home_goals == forecast.home_goals and result.visitor_goals == forecast.visitor_goals
        forecast.player.update(points: forecast.player.points + 1,
                               forecasts_half_hit: forecast.player.forecasts_half_hit - 1, forecasts_hit: forecast.player.forecasts_hit + 1)
      end
    else
      forecast.player.update(forecasts_miss: forecast.player.forecasts_miss + 1)
    end
  end
  # rubocop:enable Metrics/AbcSize

  def set_winner(home_goals, visitor_goals)
    if home_goals > visitor_goals
      'home'
    elsif home_goals < visitor_goals
      'visitor'
    else
      'draw'
    end
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def set_won_matches(match)
    if match.match_type == 'GROUP'
      if match.result.winner == 'home'
        match.home_team.update(points_of_group: match.home_team.points_of_group + 3,
                               won_match: match.home_team.won_match + 1)
        match.visitor_team.update(lost_match: match.visitor_team.lost_match + 1)
      elsif match.result.winner == 'visitor'
        match.visitor_team.update(points_of_group: match.visitor_team.points_of_group + 3,
                                  won_match: match.visitor_team.won_match + 1)
        match.home_team.update(lost_match: match.home_team.lost_match + 1)
      else
        match.home_team.update(points_of_group: match.home_team.points_of_group + 1,
                               drawn_match: match.home_team.drawn_match + 1)
        match.visitor_team.update(points_of_group: match.visitor_team.points_of_group + 1,
                                  drawn_match: match.visitor_team.drawn_match + 1)
      end
    end
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
end
