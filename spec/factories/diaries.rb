FactoryBot.define do
  factory :diary do
    title        { Faker::Lorem.sentence }
    text         { Faker::Lorem.sentence }
    url_text     { Faker::Lorem.sentence }
    year_id      { 1 }
    month_id     { 1 }
    day_id       { 1 }
    hour_id      { 1 }
    minute_id    { 1 }
    rate         { 1 }
    association  :user
  end
end
