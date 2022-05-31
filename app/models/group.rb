class Group < ActiveRecord::Base
  has_many :teams
  has_many :administrators

  validates :name, presence: true
end