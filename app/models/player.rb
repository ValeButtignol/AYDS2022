require 'bcrypt'

class Player < ActiveRecord::Base
  
  has_many :forecasts

  validates :username, presence: true
  validates :username, uniqueness: true

  # Adds salt to the password.
  has_secure_password

  # Callback that sets the player points at zero, when it is created.
  before_create do
    self.points = 0
  end
end