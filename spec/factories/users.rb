require 'faker'

FactoryBot.define do
  factory :user do
    provider { :google }
    uid { Faker::Number.within(range: 100000..999999) }
    sequence :username do |n|
        "test#{n}@test.com"
    end
    google_token { Faker::Number.within(range: 100000..999999) }
    google_refresh_token { Faker::Number.within(range: 100000..999999) }
  end
end
