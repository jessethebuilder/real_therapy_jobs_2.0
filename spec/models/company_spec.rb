require 'rails_helper'

RSpec.describe Company, :type => :model do
  describe 'Validations' do
    it{ should validate_presence_of :name }
  end

  describe 'Associations' do
    it{ should have_many :contacts }
    it{ should have_many :facilities }
  end

end
