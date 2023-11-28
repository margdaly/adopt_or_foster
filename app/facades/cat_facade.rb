# frozen_string_literal: true

class CatFacade
  def all_cat_breeds
    cat_service.all_cat_breeds.map do |breed|
      {
        breed_id: breed[:id],
        breed_name: breed[:name]
      }
    end
  end

  def random_cat_image
    cat_service.random_cat_image.first
  end

  def cat_breed_image(breed_id)
    cat_service.cat_breed_image(breed_id).first
  end

  private

  def cat_service
    @cat_service ||= CatService.new
  end
end
