FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    id { Faker::Number.between(from: 1, to: 100) }
    nickname { gimei.first.katakana }
    email { Faker::Internet.free_email }
    # aA1を先頭とする6文字以上のパスワードを変数passwordに代入
    password = "aA1#{Faker::Internet.password(min_length: 3)}"
    password { password }
    password_confirmation { password }
    family_name { gimei.last.kanji }
    first_name { gimei.first.kanji }
    family_name_kana { gimei.last.katakana }
    first_name_kana { gimei.first.katakana }
    birthday { Faker::Date.between(from: '1990-01-01', to: Date.today) }
  end
end
