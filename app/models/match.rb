class Match < ActiveRecord::Base
  belongs_to :home_team, class_name: 'Team'
  belongs_to :visitor_team, class_name: 'Team'
  has_one :result
  has_many :forecasts
  has_many :administrators
end