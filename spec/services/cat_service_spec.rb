require 'rails_helper'

describe 'Cat Service' do
  describe '#all_cat_breeds' do
    VCR.use_cassette('cat_api_breeds_request') do
      before :each do
        @cat_breeds = CatService.new.all_cat_breeds
      end

      it 'returns cat breed name and id' do
        expect(@cat_breeds).to be_a(Array)
        expect(@cat_breeds.count).to eq(67)

        @cat_breeds.each do |breed|
          expect(breed).to be_a(Hash)
          # id is a 4 letter code used to identify the breed,
          expect(breed).to have_key(:id)
          expect(breed[:id]).to be_a(String)
          expect(breed[:id].length).to eq(4)
          # first 4 letters of the breed name is used as the id
          expect(breed).to have_key(:name)
          expect(breed[:name]).to be_a(String)
        end
      end

      it 'returns description of cat breed' do
        @cat_breeds.each do |breed|
          expect(breed).to have_key(:temperament)
          expect(breed[:temperament]).to be_a(String)
          expect(breed).to have_key(:origin)
          expect(breed[:origin]).to be_a(String)
          expect(breed).to have_key(:description)
          expect(breed[:description]).to be_a(String)
          expect(breed).to have_key(:life_span)
          expect(breed[:life_span]).to be_a(String)
        end
      end

      it 'returns level of care for cat breed' do
        # Owner Info in Levels 1-5
        @cat_breeds.each do |breed|
          expect(breed).to have_key(:affection_level)
          expect(breed[:affection_level]).to be_a(Integer)
          expect(breed).to have_key(:child_friendly)
          expect(breed[:child_friendly]).to be_a(Integer)
          expect(breed).to have_key(:dog_friendly)
          expect(breed[:dog_friendly]).to be_a(Integer)
          expect(breed).to have_key(:energy_level)
          expect(breed[:energy_level]).to be_a(Integer)
          expect(breed).to have_key(:grooming)
          expect(breed[:grooming]).to be_a(Integer)
          expect(breed).to have_key(:health_issues)
          expect(breed[:health_issues]).to be_a(Integer)
          expect(breed).to have_key(:intelligence)
          expect(breed[:intelligence]).to be_a(Integer)
          expect(breed).to have_key(:shedding_level)
          expect(breed[:shedding_level]).to be_a(Integer)
          expect(breed).to have_key(:social_needs)
          expect(breed[:social_needs]).to be_a(Integer)
          expect(breed).to have_key(:stranger_friendly)
          expect(breed[:stranger_friendly]).to be_a(Integer)
          expect(breed).to have_key(:vocalisation)
          expect(breed[:vocalisation]).to be_a(Integer)
        end
      end
    end
  end
end
