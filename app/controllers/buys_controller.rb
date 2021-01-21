  class BuysController < ApplicationController
    before_action :authenticate_user!, only: [:index, :create, :new]

  def index
      @item = Item.find(params[:item_id])
      @user_buy_buy = UserBuyBuy.new
      if @item.user_id == current_user.id
        redirect_to root_path
      end
      if @item.user_buy.present?
        redirect_to root_path
      end


  end
    

  def new
    @user_buy_buy = UserBuyBuy.new
  end

  def create
      @user_buy_buy = UserBuyBuy.new(buy_params)
      @item = Item.find(params[:item_id])
      if @user_buy_buy.valid? 
        pay_item
        @user_buy_buy.save
        redirect_to root_path
      else
        render 'index'
      end
        

  end


  private 

  def buy_params
    params.require(:user_buy_buy).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_8bf12a1bd90747b3799cd25a"  
    Payjp::Charge.create(
      amount: @item.price,  
      card: buy_params[:token],    
      currency: 'jpy'           
    )
  end

end
