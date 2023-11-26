class WelcomeController < ApplicationController
  def index
    @cat = CatService.new.random_cat_image
  end
end
