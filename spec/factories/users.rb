FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { 'a00000' }
    password_confirmation { password }
    first_name { '阿部' }
    last_name { '晋三' }
    first_name_kana { 'アベ' }
    last_name_kana { 'シンゾウ' }
    birth_date { '2000-12-24' }
  end
end
