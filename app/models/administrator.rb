require 'bcrypt'

class Administrator < ActiveRecord::Base
  has_many :teams
  has_many :results
  has_many :matches

  validates :username, presence: true
  validates :username, uniqueness: true
  
  # Adds salt to the password.
  has_secure_password
end