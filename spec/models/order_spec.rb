require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('/files/camera.png')
    end

    it 'postal_code,prefecture_id,city,addresses,building,phone_numberがあれば保存できる'
    
  end
end
