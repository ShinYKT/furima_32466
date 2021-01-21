require 'rails_helper'

RSpec.describe UserBuyBuy, type: :model do
  before do
    @user_buy_buy = FactoryBot.build(:user_buy_buy)
  end
  describe '商品購入' do
    it '全ての項目が正しく入力されていれば購入できる' do
      expect(@user_buy_buy).to be_valid
    end
    it 'postal_codeが空と購入できない' do
      @user_buy_buy.postal_code = ''
      @user_buy_buy.valid?
      expect(@user_buy_buy.errors.full_messages).to include("Postal code can't be blank")
    end 
    it 'prefecture_idが空と購入できない' do
      @user_buy_buy.prefecture_id = ''  
      @user_buy_buy.valid?
      expect(@user_buy_buy.errors.full_messages).to include("Prefecture can't be blank")
    end 
    it 'municipalityが空と購入できない' do
      @user_buy_buy.municipality = ''
      @user_buy_buy.valid?
      expect(@user_buy_buy.errors.full_messages).to include("Municipality can't be blank")
    end 
    it 'addressが空と購入できない' do
      @user_buy_buy.address = ''
      @user_buy_buy.valid?
      expect(@user_buy_buy.errors.full_messages).to include("Address can't be blank")
    end 
    it 'building_nameが空でも購入できる' do
      @user_buy_buy.building_name = ''
      expect(@user_buy_buy).to be_valid
    end
    it 'phone_numberが空と購入できない' do
      @user_buy_buy.phone_number = ''
      @user_buy_buy.valid?
      expect(@user_buy_buy.errors.full_messages).to include("Phone number can't be blank")
    end 
    it 'tokenが空と購入できない' do
      @user_buy_buy.token= ''
      @user_buy_buy.valid?
      expect(@user_buy_buy.errors.full_messages).to include("Token can't be blank")
    end 
    it 'postal_codeにはハイフンがないと購入できない' do
      @user_buy_buy.postal_code = '6340062'
      @user_buy_buy.valid?
    expect(@user_buy_buy.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end 
    it 'phone_numberが12桁以上だと購入できない' do
      @user_buy_buy.phone_number = '090888888888'
      @user_buy_buy.valid?
      expect(@user_buy_buy.errors.full_messages).to include("Phone number is invalid.")
    end 
  end
end
