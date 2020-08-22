FactoryBot.define do
    factory :user do
      # name     { Faker::FunnyName.name }
      uid      { Faker::Address.zip }
      password { "123456" }
      sequence :username do |n|
        "test#{n}@test.com"
      end
    end
  end
