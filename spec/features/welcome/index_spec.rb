# frozen_string_literal: true

require 'rails_helper'

describe 'Welcome Index Page' do
  before :each do
    visit '/'
  end

  it 'has a welcome message' do
    expect(page).to have_content('Welcome! Here is a picture of a cat!')
  end

  it 'has an image of a cat' do
    expect(page).to have_css('img')
  end
end
