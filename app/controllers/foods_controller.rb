class FoodsController < ApplicationController
    def index
      @foods = Food.all
    end
  
    def show
      @food = Food.find_by(id: params[:id])
    end
  
    def new
      @food = Food.new
    end
  
    def create
      food = food.create(food_params)
      redirect_to food_path(food)
    end
  
    def edit
      @food = Food.find_by(id: params[:id])
    end
  
    def update
      food = Food.find_by(id: params[:id])
      food.update(food_params)
      redirect_to food_path(food)
    end

    def destroy
        food = Food.find_by(id: params[:id])
        food.delete
        redirect_to root_path
    end
  
    private
    def food_params
      params.require(:food).permit(
          :name,
          :brand,
          :carb_count,
          :fiber_count,
          :protein_count,
          :fat_count,
          :calorie_count
        )
    end
  end 
  