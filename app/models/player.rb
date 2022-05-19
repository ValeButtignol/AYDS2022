class Player < ActiveRecord::Base
  
  has_many :forecasts

  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
  validates :password, confirmation: true

  # Callback that sets the player points at zero, when it is created.
  before_create do
    self.points = 0
  end
end