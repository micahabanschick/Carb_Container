class Day < ApplicationRecord
    belongs_to :user
    has_many :meals
    has_many :foods 
    has_many :exercises
end
