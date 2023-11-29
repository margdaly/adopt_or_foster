class WelcomeController < ApplicationController
  def index
    @cat = CatFacade.new
  end
end
