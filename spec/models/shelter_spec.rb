# frozen_string_literal: true

require 'rails_helper'

describe Shelter, type: :model do
  describe 'validations' do
    it { should validate_presence_of :foster_program }
    it { should validate_presence_of :name }
    it { should validate_presence_of :city }
  end
end
