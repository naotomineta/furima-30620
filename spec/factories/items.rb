FactoryBot.define do
  factory :item do
    name {Faker::Name.initials(number: 3)}
    price {1234}
    info {Faker::Lorem.sentence}
    sales_status_id {1}
    shipping_fee_status_id {2}
    prefecture_id {3}
    schedule_delivery_id {1}
    category_id {2}
    association :user
  end
end
