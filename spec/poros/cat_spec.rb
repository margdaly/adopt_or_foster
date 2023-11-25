# frozen_string_literal: true

require 'rails_helper'

describe 'Cat Object' do
  it 'exists and has attributes' do
    data = {  id: 'abys',
              name: 'Abyssinian',
              temperament: 'Active, Energetic, Independent, Intelligent, Gentle',
              origin: 'Egypt',
              description: 'The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.',
              life_span: '14 - 15' }

    cat = Cat.new(data)

    expect(cat).to be_a(Cat)
    expect(cat.breed_id).to eq('abys')
    expect(cat.breed_name).to eq('Abyssinian')
    expect(cat.temperament).to eq('Active, Energetic, Independent, Intelligent, Gentle')
    expect(cat.origin).to eq('Egypt')
    expect(cat.description).to eq("The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.")
    expect(cat.life_span).to eq('14 - 15')
  end
end
