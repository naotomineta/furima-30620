require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '#create' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it 'postal_code,prefecture_id,city,addresses,phone_number,tokenがあれば保存できる' do
      @user_order.building = ''
      expect(@user_order).to be_valid
    end

    it 'postal_codeが空だと保存できない' do
      @user_order.postal_code = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeにハイフンがないと保存できない' do
      @user_order.postal_code = '1234567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Postal code is invalid')
    end

    it 'prefecture_idが---だと保存できない' do
      @user_order.prefecture_id = 0
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Prefecture must be other than 0')
    end

    it 'cityが空だと保存できない' do
      @user_order.city = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end

    it 'addressesが空だと保存できない' do
      @user_order.addresses = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Addresses can't be blank")
    end

    it 'phone_numberが空だと保存できない' do
      @user_order.phone_number = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが12桁以上だと保存できない' do
      @user_order.phone_number = '080123456789'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Phone number is invalid')
    end

    it 'tokenが空だと保存できない' do
      @user_order.token = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
