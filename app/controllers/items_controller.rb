class ItemsController < ApplicationController
  # before_action :basic_auth
  before_action :authenticate_user!, only: [:create, :new, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]


  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

  end
  
  def show
  end


  def edit
    if @item.user_id != current_user.id || @item.user_buy.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
    end
    redirect_to root_path

  end

  private

  def set_item
    @item = Item.find(params[:id])
  end


  def item_params
    params.permit(:image, :name, :text, :category_id, :state_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"] 
    end
  end
end
