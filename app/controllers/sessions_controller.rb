class SessionsController < ApplicationController
  # skip_before_action :verify_user_is_authenticated, only: [:new,:create]

  def new
    @user = User.new
    @users = User.all
  end

  def create
    # binding.pry
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome back your Carb Container Profile!"
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end
end
