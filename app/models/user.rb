class User < ActiveRecord::Base

  validates :username, :email, :password, presence: true

end

class PlayerUser < User
  
  has_many :forecasts

end

class AdminUser < User
  
end