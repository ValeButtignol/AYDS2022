class Team < ActiveRecord::Base
  
  has_many :local_matches, foreign_key: 'local_id', class_name: 'Match'
  has_many :visitor_matches, foreign_key: 'visitor_id', class_name: 'Match'
  has_many :administrators
  
  validates :name, presence: true
  validates :name, uniqueness: true 
  
end
