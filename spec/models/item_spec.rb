require 'rails_helper'

RSpec.describe User, type: :model do
  describe '出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test.png')
    end
  
    it '全ての項目が正しく入力されていれば登録できる' do
      expect(@item).to be_valid
    end

    it 'imageが空と登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
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
    it 'category_idが1だと登録できない' do
      @item.category_id = 1  
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end  
    it 'state_idが1だと登録できない' do
      @item.state_id = 1  
      @item.valid?
      expect(@item.errors.full_messages).to include("State must be other than 1")
    end  
    it 'delivery_fee_idが1だと登録できない' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
    end  
    it 'prefecture_idが1だと登録できない' do
      @item.prefecture_id = 1 
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end  
    it 'delivery_day_idが1だと登録できない' do
      @item.delivery_day_id = 1  
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
    end  
    it 'priceが数字以外だと登録できない' do
      @item.price = 'じ'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it 'priceが299以下だと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it 'priceが10000000以上だと登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

  end
end
