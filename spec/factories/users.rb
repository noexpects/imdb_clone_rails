FactoryBot.define do
  factory :user do
    email { FFaker::Internet.unique.email }
    password { FFaker::Lorem.characters(10) }
    confirmed_at { FFaker::Time.datetime }
  end
end
