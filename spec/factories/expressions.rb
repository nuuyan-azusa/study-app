FactoryBot.define do
  factory :expression do
    name        { Faker::Lorem.sentence }
    text        { Faker::Lorem.sentence }
    url_text    { Faker::Lorem.sentence }
    association :user
  end
end
