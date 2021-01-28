FactoryBot.define do
  factory :manner do
    name        { Faker::Lorem.sentence }
    text        { Faker::Lorem.sentence }
    url_text    { Faker::Lorem.sentence }
    association :user
  end
end
