class User < ApplicationRecord
    has_secure_password
    has_many :user_foods
    has_many :foods, through: :user_foods
    has_many :days 
    has_many :exercises, through: :days
    has_many :meals 
    validates :name, presence: true
    validates :password, length: { minimum: 3 }

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

    def current_carbs
        carbs = 0
        self.foods.each{|food| carbs += food.carb_count}
        carbs 
    end 

    def current_proteins
        proteins = 0
        self.foods.each{|food| proteins += food.protein_count}
        proteins 
    end 

    def current_fibers
        fibers = 0
        self.foods.each{|food| fibers += food.fiber_count}
        fibers 
    end 

    def current_fats
        fats = 0
        self.foods.each{|food| fats += food.fat_count}
        fats 
    end 

    def current_calories
        calories = 0
        self.foods.each{|food| calories += food.calorie_count}
        calories 
    end 
end
