# frozen_string_literal: true

FactoryBot.define do
  factory :pet do
    shelter
    adoptable { true }

    trait :cat do
      breed { Faker::Creature::Cat.breed[0, 4] }
      name { Faker::Creature::Cat.name }
    end
  end
end
