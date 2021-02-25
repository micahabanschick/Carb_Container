class UsersController < ApplicationController
    skip_before_action :verify_user_is_authenticated, only: [:new,:create]

    def new
      @user = User.new
    #   @lifestyles = ["Sedentary", "Mildly Active", "Moderately Active", "Intensely Active"]
    end

    def index 
        @users = User.all 
    end 

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render 'new'
      end
    end

    def show
      @user = User.find_by(id: params[:id])
    end

    def edit 
      @user = User.find_by(id: params[:id])
    end 

    def update 
      user = User.find_by(id: params[:id])
      user.update(user_params)
      redirect_to user_path(user)
    end 

    def goodnight
      user = User.find_by(id: params[:id])
      user.user_foods.destroy_all
      redirect_to user_path(user)
    end
  
    private
    def user_params
      params.require(:user).permit(
        :name,
        :password,
        :sex,
        :age,
        :height,
        :weight,
        :lifestyle
        )
    end
  end 
  