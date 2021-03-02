class SessionsController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]

  def new
    # binding.pry
    @user = User.new
    @users = User.all
  end

  def create
    # binding.pry
    if auth 
      # byebug 
      user = User.find_or_create_by(name: auth['info']['name']) do |u|
        u.password = SecureRandom.hex(12)
      end 
      session[:user_id] = user.id
      redirect_to user 
    else 
      @user = User.find_by(name: params[:user][:name]) 
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "Welcome back your Carb Container Profile!"
      else
        @user = User.new
        render 'new'
      end
    end 
  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end

  private 

  def auth 
    request.env['omniauth.auth']
  end
end
