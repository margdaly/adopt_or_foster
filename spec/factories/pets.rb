# frozen_string_literal: true

FactoryBot.define do
  factory :pet do
    shelter
    adoptable { true }
    breed { Faker::Creature::Cat.breed[0, 4] }
    name { Faker::Creature::Cat.name }
  end
end
