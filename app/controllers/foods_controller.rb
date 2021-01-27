class FoodsController < ApplicationController
    def index
      @foods = Food.all
    end
  
    def show
      @food = Food.find_by(id: params[:id])
      @user_food = @food.user_foods.build(user_id: current_user.id)
    end
  
    def new
      @food = Food.new
    end
  
    def create
      food = food.create(food_params)
      redirect_to food_path(food)
    end

    def add
        user_food = UserFood.create(user_id: current_user.id, food_id: params[:food_id])
        message = user_food.consume
        redirect_to user_path(user_food.user), flash: { message: message }
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
  