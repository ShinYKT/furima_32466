FactoryBot.define do
  factory :user do
    nick_name { 'test' }
    email { 'fff@gmail.com' }
    password { 'sy114088' }
    password_confirmation { password }
    last_name { '苗字' }
    first_name { '名前' }
    last_name_kana { 'ミョウジ' }
    first_name_kana { 'ナマエ' }
    birthday { '1988-04-11' }
  end
end
