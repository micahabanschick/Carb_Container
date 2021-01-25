class Food < ApplicationRecord
    has_many :user_foods
    has_many :users, through: :user_foods 
    has_many :meal_foods
    has_many :meals, through: :meal_foods
end
