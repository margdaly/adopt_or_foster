class CatsController < ApplicationController
  before_action :find_breed_id, only: [:show]

  def show
  end

  private

  def cat_params
    params.permit(:breed_id)
  end

  def find_breed_id
    @breed_id = cat_params[:breed_id]
  end
end
