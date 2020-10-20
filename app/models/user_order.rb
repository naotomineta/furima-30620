class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10,11}\z/  }
    validates :token
    end  
  
    validates :prefecture_id, numericality: { other_than: 0 }

    def save
      managemant = Managemant.create(user_id: user_id, item_id: item_id)
      Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, managemant_id: managemant.id,token: token)
    end

end