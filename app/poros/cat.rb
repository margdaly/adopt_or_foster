# frozen_string_literal: true

class Cat
  attr_reader :breed_id,
              :breed_name

  def initialize(cat_data)
    @breed_id = cat_data[:id]
    @breed_name = cat_data[:name]
  end
end
