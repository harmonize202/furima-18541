FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname              {Faker::Name.initials(number: 4)}
    last_name             {"野口"}
    first_name            {"大樹"}
    last_name_kana        {"ノグチ"}
    first_name_kana       {"ヒロキ"}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2021-02-19')}
  end
end
