class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :schedule_delivery
  belongs_to :user
  has_many :comments
  has_one :managemant
 
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price, format: { with: /\A[0-9]+\z/ }, inclusion: { in: 300..9_999_999 }
    validates :info
    validates :sales_status
    validates :shipping_fee_status
    validates :prefecture
    validates :schedule_delivery
    validates :category
    validates :image
  end

  with_options numericality: { other_than: 0 } do
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :schedule_delivery_id
    validates :category_id
  end
end
