class Result < ActiveRecord::Base
  belongs_to :match
  has_many :administrators


  # Callback that sets result.winner automaticly.
  before_create do
    self.winner = set_winner(self.home_goals, self.visitor_goals) 
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