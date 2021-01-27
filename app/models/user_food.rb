class UserFood < ApplicationRecord
    belongs_to :user
    belongs_to :food 

    def consume 
        "Yum Yum!\nMore food was eaten."
    end 
end
