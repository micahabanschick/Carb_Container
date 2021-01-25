class User < ApplicationRecord
    has_secure_password
    has_many :user_foods
    has_many :foods, through: :user_foods
    has_many :days 
    has_many :exercises, through: :days
    has_many :meals 
end
