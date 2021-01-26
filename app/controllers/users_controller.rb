class UsersController < ApplicationController
    skip_before_action :verify_user_is_authenticated, only: [:new,:create]

    def new
      @user = User.new
    #   @lifestyles = ["Sedentary", "Mildly Active", "Moderately Active", "Intensely Active"]
    end

    def create
      if user = User.create user_params
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        render 'new'
      end
    end

    def show
      @user = User.find_by(id:params[:id])
    end
  
    private
    def user_params
      params.require(:user).permit(
        :name,
        :height,
        :weight,
        :lifestyle,
        :password,
        )
    end
  end 
  