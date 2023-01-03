# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    title { 'MyString' }
    prep_time_hours { 1 }
    prep_time_minutes { 1 }
    cook_time_hours { 1 }
    cook_time_minutes { 1 }
    serving_size { 'MyString' }
    servings { 1 }
    instruction_video { 'MyString' }
    short_description { 'MyString' }
    instructions { Faker::Lorem.characters(number: 1001) }
  end
end
