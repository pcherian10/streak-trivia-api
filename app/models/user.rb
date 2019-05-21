class User < ApplicationRecord
  has_many :attempts
  has_many :questions, through: :attempts 
  has_many :streaks
  
  has_secure_password
end
