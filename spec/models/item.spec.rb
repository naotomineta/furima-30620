require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('/files/camera.png')
    end

    it 'name,price,info,sales_status_id,shipping_fee_status_id,prefecture_id,schedule_delivery_id,category_idがあれば保存できる' do
      expect(@item).to be_valid
    end

    it 'nameが空だと保存できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'priceが空だと保存できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが299以下だと保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it 'priceが9999999以上だと保存できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it 'priceに半角数字以外が含まれると保存できない' do
      @item.price = '１234'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it 'infoが空だと保存できない' do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end
    it 'sales_status_idが---だと保存できない' do
      @item.sales_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Sales status must be other than 0')
    end
    it 'shipping_fee_status_idが---だと保存できない' do
      @item.shipping_fee_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee status must be other than 0')
    end
    it 'prefecture_idが---だと保存できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
    end
    it 'schedule_delivery_idが---だと保存できない' do
      @item.schedule_delivery_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Schedule delivery must be other than 0')
    end
    it 'category_idが---だと保存できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 0')
    end
  end
end
