# frozen_string_literal: true

# Purpose: To make a call to the cat api and return the data
class CatService
  def all_cat_breeds
    get_url('breeds')
  end

  def random_cat_image
    get_url('images/search')
  end

  def multi_random_cat_images(amount)
    get_url("images/search?limit=#{amount}")
  end

  def cat_breed_image(breed_id)
    get_url("images/search?breed_ids=#{breed_id}")
  end

  def multi_cat_breed_images(breed_id, amount)
    get_url("images/search?breed_ids=#{breed_id}&limit=#{amount}")
  end

  private

  def conn
    Faraday.new('https://api.thecatapi.com/v1/') do |f|
      f.headers['x-api-key'] = ENV['CAT_API_KEY']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
