class Pet < ApplicationRecord
  validates :adoptable, presence: true
  validates :breed, presence: true
  validates_length_of :breed, is: 4
  validates :name, presence: true
end
