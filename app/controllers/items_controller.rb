class ItemsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "A new item has been added to your list!"
      redirect_to current_user
    else
      flash[:error] = "That item could not be added.  Please try again."
      redirect_to current_user
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:success] = "That to-do item has been deleted."
      redirect_to current_user
    else 
      flash[:error] = "That item could not be added.  Please try again."
      redirect_to current_user  
    end  
  end

  private

    def item_params
      params.require(:item).permit(:name)
    end

    def correct_user
      @item = current_user.items.find_by(id: params[:id])
      redirect_to root_url if @item.nil?
    end
end
