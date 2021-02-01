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

    def calorie_needs
        if self.lifestyle == "Sedentary"
            calorie_needs = self.bmr * 1.2
        elsif self.lifestyle == "Mildly Active"
            calorie_needs = self.bmr * 1.375
        elsif self.lifestyle == "Moderately Active"
            calorie_needs = self.bmr * 1.55
        elsif self.lifestyle == "Very Active"
            calorie_needs = self.bmr * 1.725
        elsif self.lifestyle == "Intensely Active"
            calorie_needs = self.bmr * 1.9
        end 
    end 
end
