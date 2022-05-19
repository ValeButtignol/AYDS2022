class Administrator < ActiveRecord::Base
  has_many :teams
  has_many :results
  has_many :matches

  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
  validates :password, confirmation: true
  
end