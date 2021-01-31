class User < ApplicationRecord
    has_secure_password
    has_many :user_foods
    has_many :foods, through: :user_foods
    has_many :days 
    has_many :exercises, through: :days
    has_many :meals 

    def bmr
        if self.sex == "M"
            bmr = (10 * self.weight) + (6.25 * self.height) - (5 * self.age) + 5
        else 
            bmr = (10 * self.weight) + (6.25 * self.height) - (5 * self.age) - 161
        end 
    end
end
