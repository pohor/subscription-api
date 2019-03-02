FactoryBot.define do
  factory :subcription_request do
    name: { Faker::Lorem.word }
    address: { Faker::Lorem.word }
    zipcode: { Faker::Number.number(5) }
    card_num: { Faker::Number.number(16) }
    expiration: { Faker::Date.between(1.year.ago, 5.years.from_now) }
    cvv: { Faker::Number.number(3) }
    billing_zip: { Faker.number(5) }
  end
end
