FactoryBot.define do
  factory :order do
    postal_code       {'123-4567'}
    prefecture_id     {Faker::Number.between(from: 2, to: 48)}
    city              {Faker::Address.city}
    address           {Faker::Address.building_number}
    building          {Faker::Address.secondary_address}
    phone_number      {'09011112222'}
    order_history_id  {1}
    price             {3000}
    token             {"tok_abcdefghijk00000000000000000"}
    user_id           {1}
    item_id           {1}
  end
end
