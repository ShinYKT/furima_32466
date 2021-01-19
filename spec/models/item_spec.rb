require 'rails_helper'

RSpec.describe User, type: :model do
  describe '出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end
  
    it '全ての項目が正しく入力されていれば登録できる' do
      expect(@item).to be_valid
    end
    it 'nameが空と登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'textが空と登録できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'category_idが空と登録できない' do
      @item.category_id = ''  
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end
    it 'state_id が空と登録できない' do
      @item.state_id  = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("State is not a number")
    end
    it 'delivery_fee_idが空と登録できない' do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee is not a number")
    end
    it 'prefecture_idが空と登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture is not a number")
    end
    it 'delivery_day_idが空と登録できない' do
      @item.delivery_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day is not a number")
    end
    it 'priceが空と登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
      
  end
end
