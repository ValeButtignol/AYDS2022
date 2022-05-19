class Administrator < ActiveRecord::Base
  has_many :teams
  has_many :results
  has_many :matches
end