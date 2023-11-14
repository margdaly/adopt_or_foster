require 'rails_helper'

describe Pet, type: :model do
  describe 'validations' do
    it { should validate_presence_of :adoptable }
    it { should validate_presence_of :breed }
    it { should validate_presence_of :name }
  end
end
