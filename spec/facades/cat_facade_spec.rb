# frozen_string_literal: true

require 'rails_helper'

describe 'Cat Facade' do
  describe '#all_cat_breeds' do
    it 'returns a list of cat breed_ids and breed_names' do
      stub_request(:get, 'https://api.thecatapi.com/v1/breeds') \
        .to_return(body: File.read('spec/fixtures/the_cat_api/all_cat_breeds.json'))

      cat_info = CatFacade.new.all_cat_breeds

      expect(cat_info).to be_a(Array)
      expect(cat_info.count).to eq(64)

      cat_info.each do |info|
        expect(info).to be_a(Hash)
        expect(info).to have_key(:breed_id)
        expect(info[:breed_id]).to be_a(String)
        expect(info[:breed_id].length).to eq(4)
        expect(info).to have_key(:breed_name)
        expect(info[:breed_name]).to be_a(String)
        expect(info.keys).to contain_exactly(:breed_id, :breed_name)
      end
    end
  end
end
