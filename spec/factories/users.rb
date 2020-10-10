FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password { 'aaa888' }
    password_confirmation { password }
    nickname { 'う' }
    first_name { 'え' }
    last_name { 'い' }
    first_name_kana { 'エ' }
    last_name_kana { 'イ' }
    birth_date { Faker::Date.backward }
  end
end
