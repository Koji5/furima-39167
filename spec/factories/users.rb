FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {'Pass01'}
# Rubyのバージョンが2.7以上で、Fakerのバージョンが2.17.0以上の場合、以下が使用できる。
#   password              {Faker::Alphanumeric.alpha_number(6)}
    password_confirmation {password}
    first_name            {'山田'}
    last_name             {'太郎'}
    first_name_kana       {'ヤマダ'}
    last_name_kana        {'タロウ'}
# Rubyのバージョンが2.7以上で、Fakerのバージョンが2.22.0以上の場合、以下が使用できる。
#   first_name            {Faker::Name.ja_first_name}
#   last_name             {Faker::Name.ja_last_name}
#   first_name_kana       {Faker::Japanese::Katakana.first_name}
#   last_name_kana        {Faker::Japanese::Katakana.last_name}
    birth_date            {Faker::Date.birthday}
  end
end