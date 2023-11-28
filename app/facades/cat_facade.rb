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

  def all_cat_breed_names
    all_cat_breeds.map do |breed|
      breed[:name]
    end
  end

  private

  def cat_service
    @cat_service ||= CatService.new
  end
end
