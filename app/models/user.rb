class User < ActiveRecord::Base
end

class PlayerUser < User
  has_many :forecasts
end

class AdminUser < User
end