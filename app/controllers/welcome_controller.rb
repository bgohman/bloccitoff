class WelcomeController < ApplicationController
  def home
    if logged_in?
      @item = current_user.items.build
      @user = current_user
    end 
  end

  def about
  end
end
