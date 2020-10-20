FactoryBot.define do
  factory :user_order do
    postal_code {"122-0033"}
    prefecture_id  {2}
    city        {"札幌"}
    addresses   {"青山"}
    building    {"アパート"}
    phone_number {"08034343443"}
    token       {"tok_abcdefghijk00000000000000000"}
  end
end
