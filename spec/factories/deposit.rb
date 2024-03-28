FactoryBot.define do
  factory :deposit do
    amount { 110.01 }
    deposit_date { Faker::Time.between(from: 2.days.ago, to: Time.now) }
  end
end