# frozen_string_literal: true

require 'rails_helper'

describe 'Cat Facade' do
  let(:cat_facade) { CatFacade.new }

  describe '#all_cat_breeds' do
    it 'returns a list of cat breed_ids and breed_names' do
      stub_request(:get, 'https://api.thecatapi.com/v1/breeds') \
        .to_return(body: File.read('spec/fixtures/the_cat_api/all_cat_breeds.json'))

      cat_info = cat_facade.all_cat_breeds

      expect(cat_info).to be_a(Array)
      expect(cat_info.count).to eq(64)

      cat_info.each do |info|
        expect(info).to be_a(Hash)
        expect(info.keys).to contain_exactly(:breed_id, :breed_name)
        expect(info.values).to all(be_a(String))
        expect(info[:breed_id].length).to eq(4)
      end
    end
  end

  describe '#random_cat_image' do
    it 'returns data for a random cat image' do
      stub_request(:get, 'https://api.thecatapi.com/v1/images/search') \
        .to_return(body: File.read('spec/fixtures/the_cat_api/random_cat_image.json'))

      rando_cat_img = cat_facade.random_cat_image

      expect(rando_cat_img).to be_a(Hash)
      expect(rando_cat_img).to have_key(:id)
      expect(rando_cat_img[:id]).to be_a(String)
      expect(rando_cat_img).to have_key(:url)
      expect(rando_cat_img[:url]).to be_a(String)
      expect(rando_cat_img).to have_key(:width)
      expect(rando_cat_img[:width]).to be_a(Integer)
      expect(rando_cat_img).to have_key(:height)
      expect(rando_cat_img[:height]).to be_a(Integer)
    end
  end

  describe '#cat_breed_images' do
    it 'returns data for a cat breed image' do
      breed_id = 'beng'
      stub_request(:get, "https://api.thecatapi.com/v1/images/search?breed_ids=#{breed_id}") \
        .to_return(body: File.read('spec/fixtures/the_cat_api/cat_breed_image.json'))

      beng_cat_img = cat_facade.cat_breed_image('beng')

      expect(beng_cat_img).to be_a(Hash)
      expect(beng_cat_img).to have_key(:id)
      expect(beng_cat_img[:id]).to be_a(String)
      expect(beng_cat_img[:id].size).to eq(9)
      expect(beng_cat_img).to have_key(:url)
      expect(beng_cat_img[:url]).to be_a(String)
      expect(beng_cat_img).to have_key(:width)
      expect(beng_cat_img[:width]).to be_a(Integer)
      expect(beng_cat_img).to have_key(:height)
      expect(beng_cat_img[:height]).to be_a(Integer)
    end
  end
end
