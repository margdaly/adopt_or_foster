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
    it 'returns a url for a random cat image' do
      stub_request(:get, 'https://api.thecatapi.com/v1/images/search') \
        .to_return(body: File.read('spec/fixtures/the_cat_api/random_cat_image.json'))

      rando_cat_img = cat_facade.random_cat_image

      expect(rando_cat_img).to be_a(Array)
      expect(rando_cat_img.count).to eq(1)
      expect(rando_cat_img.first).to be_a(Hash)
      expect(rando_cat_img.first).to have_key(:id)
      expect(rando_cat_img.first[:id]).to be_a(String)
      expect(rando_cat_img.first).to have_key(:url)
      expect(rando_cat_img.first[:url]).to be_a(String)
      expect(rando_cat_img.first).to have_key(:width)
      expect(rando_cat_img.first[:width]).to be_a(Integer)
      expect(rando_cat_img.first).to have_key(:height)
      expect(rando_cat_img.first[:height]).to be_a(Integer)
    end
  end
end
