# frozen_string_literal: true

FactoryBot.define do
  factory :shelter do
    foster_program { true }
    name { "#{Faker::Company.name} Pet Shelter" }
    city { 'Denver' }
  end
end
