class Team < ActiveRecord::Base
  has_many :home_matches, foreign_key: 'home_id', class_name: 'Match'
  has_many :visitor_matches, foreign_key: 'visitor_id', class_name: 'Match'
  has_many :administrators
  belongs_to :group

  validates :name, presence: true
  validates :name, uniqueness: true
end
