require 'rails_helper'

describe 'Cat Service' do
  describe '#all_cat_breeds' do
    VCR.use_cassette('cat_api_breeds_request') do
      let(:cat_breeds) { CatService.new.all_cat_breeds }

      it 'returns cat breed name and id' do
        expect(cat_breeds).to be_a(Array)
        expect(cat_breeds.count).to eq(67)

        cat_breeds.each do |breed|
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
        cat_breeds.each do |breed|
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
        cat_breeds.each do |breed|
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

  describe '#random_cat_image' do
    it 'returns a random picture of a cat' do
      stub_request(:get, 'https://api.thecatapi.com/v1/images/search') \
        .to_return(body: File.read('spec/fixtures/the_cat_api/random_cat_image.json'))

      rando_cat_img = CatService.new.random_cat_image

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

  describe '#multi_random_cat_images' do
    it 'returns a collection of cat pictures based on the selected quantity' do
      img_amount = 10
      stub_request(:get, "https://api.thecatapi.com/v1/images/search?limit=#{img_amount}") \
        .to_return(body: File.read('spec/fixtures/the_cat_api/multi_random_cat_images.json'))

      cat_pics = CatService.new.multi_random_cat_images(10)

      expect(cat_pics).to be_a(Array)
      expect(cat_pics.count).to eq(10)

      cat_pics.each do |img_info|
        expect(img_info).to be_a(Hash)
        expect(img_info).to have_key(:id)
        expect(img_info[:id]).to be_a(String)
        expect(img_info[:id].size).to eq(9)
        expect(img_info).to have_key(:url)
        expect(img_info[:url]).to be_a(String)
        expect(img_info).to have_key(:width)
        expect(img_info[:width]).to be_a(Integer)
        expect(img_info).to have_key(:height)
        expect(img_info[:height]).to be_a(Integer)
      end
    end
  end

  describe '#cat_breed_image' do
    it 'returns a picture of a cat by breed' do
      VCR.use_cassette('cat_api_breed_image_request') do
        # breed_id = 'beng'

        # stub_request(:get, "https://api.thecatapi.com/v1/images/search?breed_ids=#{breed_id}") \
        #   .to_return(body: File.read('spec/fixtures/the_cat_api/cat_breed_image.json'))

        beng_cat_img = CatService.new.cat_breed_image('beng')

        expect(beng_cat_img).to be_a(Array)
        expect(beng_cat_img.count).to eq(1)
        expect(beng_cat_img.first).to be_a(Hash)
        expect(beng_cat_img.first).to have_key(:id)
        expect(beng_cat_img.first[:id]).to be_a(String)
        expect(beng_cat_img.first[:id].size).to eq(9)
        expect(beng_cat_img.first).to have_key(:url)
        expect(beng_cat_img.first[:url]).to be_a(String)
        expect(beng_cat_img.first).to have_key(:width)
        expect(beng_cat_img.first[:width]).to be_a(Integer)
        expect(beng_cat_img.first).to have_key(:height)
        expect(beng_cat_img.first[:height]).to be_a(Integer)
      end
    end
  end

  describe '#multi_cat_breed_images' do
    it 'returns a collection of cat pictures based on the selected quantity and breed' do
      breed_id = 'beng'
      img_amount = 10

      stub_request(:get, "https://api.thecatapi.com/v1/images/search?breed_ids=#{breed_id}&limit=#{img_amount}") \
        .to_return(body: File.read('spec/fixtures/the_cat_api/multi_cat_breed_images.json'))

      bengal_imgs = CatService.new.multi_cat_breed_images('beng', 10)

      expect(bengal_imgs).to be_a(Array)
      expect(bengal_imgs.count).to eq(10)

      bengal_imgs.each do |img_info|
        expect(img_info).to be_a(Hash)
        expect(img_info).to have_key(:id)
        expect(img_info[:id]).to be_a(String)
        expect(img_info[:id].size).to eq(9)
        expect(img_info).to have_key(:url)
        expect(img_info[:url]).to be_a(String)
        expect(img_info).to have_key(:width)
        expect(img_info[:width]).to be_a(Integer)
        expect(img_info).to have_key(:height)
        expect(img_info[:height]).to be_a(Integer)
      end
    end
  end
end
