class StaticPagesController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:welcome, :home]

  def welcome
    # binding.pry
  end

  def home
  end
end
