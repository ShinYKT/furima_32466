  class BuysController < ApplicationController
    before_action :basic_auth
    before_action :authenticate_user!, only: [:index, :create]
    before_action :set_item, only: [:index, :create]
    
  def index
      @user_buy_buy = UserBuyBuy.new
      if @item.user_id == current_user.id || @item.user_buy.present?
        redirect_to root_path
      end
      


  end
    

  def create
      @user_buy_buy = UserBuyBuy.new(buy_params)
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
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY'] 
    Payjp::Charge.create(
      amount: @item.price,  
      card: buy_params[:token],    
      currency: 'jpy'           
    )
  end
  
  def set_item
  @item = Item.find(params[:item_id])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
