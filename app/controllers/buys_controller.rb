  class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_buy_buy = UserBuyBuy.new
    
  end

  def new
    @user_buy_buy = UserBuyBuy.new
  end

def create
    @user_buy_buy = UserBuyBuy.new(buy_params)
    @user_buy_buy.save
  end


  private 

  def buy_params
    params.require(:user_buy_buy).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
