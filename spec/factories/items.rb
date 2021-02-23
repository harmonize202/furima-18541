FactoryBot.define do
  factory :item do
    item_name               { Faker::Lorem.sentence }
    explanation             { Faker::Lorem.sentence }
    category_id             { Faker::Number.between(from: 2, to: 11) }
    status_id               { Faker::Number.between(from: 2, to: 7) }
    delivery_fee_id         { Faker::Number.between(from: 2, to: 3) }
    shipment_source_id      { Faker::Number.between(from: 2, to: 48) }
    shipment_day_id         { Faker::Number.between(from: 2, to: 4) }
    price                   { Faker::Number.between(from: 300, to: 9999999) }
    association :user
  end
end
