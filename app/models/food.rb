class Food < ApplicationRecord
    has_many :user_foods
    has_many :users, through: :user_foods 
    has_many :meal_foods
    has_many :meals, through: :meal_foods
    validates :name, presence: true
    validates :carb_count, presence: true
    validates :protein_count, presence: true
    validates :fat_count, presence: true
    validates :calorie_count, presence: true
end
