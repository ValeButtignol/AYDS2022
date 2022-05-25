require 'bcrypt'

class Player < ActiveRecord::Base
  
  has_many :forecasts

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  # Adds salt to the password.
  has_secure_password

  # Callback that sets the player points at zero, when it is created.
  before_create do
    self.points = 0
  end
end