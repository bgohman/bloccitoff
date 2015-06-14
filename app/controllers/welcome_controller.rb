class WelcomeController < ApplicationController
  def home
    if logged_in?
      @item = current_user.items.build
      @user = current_user
      @todo_list_items = current_user.todo_list
    end 
  end

  def about
  end
end
