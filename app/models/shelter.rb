# frozen_string_literal: true

class Shelter < ApplicationRecord
  validates :foster_program, presence: true
  validates :name, presence: true
  validates :city, presence: true

  has_many :pets
end
