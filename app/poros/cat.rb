# frozen_string_literal: true

class Cat
  attr_reader :breed_id,
              :breed_name,
              :temperament,
              :origin,
              :description,
              :life_span

  def initialize(cat_data)
    @breed_id = cat_data[:id]
    @breed_name = cat_data[:name]
    @temperament = cat_data[:temperament]
    @origin = cat_data[:origin]
    @description = cat_data[:description]
    @life_span = cat_data[:life_span]
  end
end
