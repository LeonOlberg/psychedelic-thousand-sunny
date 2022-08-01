# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :referral do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    contact
  end

  factory :contact do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    address { Faker::Address.full_address }
  end

  factory :event do
    kind { :contact_created }
    coffee_id = "#{Faker::Coffee.blend_name}_id"
    reference { Faker::Json.shallow_json(width: 1, options: { key: 'Lorem.word', value: 'Internet.uuid' }) }
  end
end
