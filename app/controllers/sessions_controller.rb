class SessionsController < ApplicationController
  # skip_before_action :verify_user_is_authenticated, only: [:new,:create]

  def new
    # binding.pry
    @user = User.new
    @users = User.all
  end

  def create
    binding.pry
    if auth 
      binding.pry
      byebug 
      user = User.find_or_create_by(email: auth['info']['email']) do |u|
        u.password = SecureRandom.hex(12)
      end 
      if user 
        redirect_to user 
      end
    else 
      @user = User.find_by(name: params[:user][:name])
    end 
    
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome back your Carb Container Profile!"
    else
      render 'new'
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
