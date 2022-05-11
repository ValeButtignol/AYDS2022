class Result < ActiveRecord::Base
  belongs_to :match
  validates :local_goals, uniqueness: true
  validates :visitor_goals, uniqueness: true
  validates :winner, uniqueness: true

end