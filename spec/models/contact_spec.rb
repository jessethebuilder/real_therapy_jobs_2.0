require 'rails_helper'

RSpec.describe Contact, :type => :model do
  describe 'Validations' do
    it{ should validate_presence_of :name }
  end

  describe 'Associations' do
    it{ should belong_to :company }
    it{ should have_many :facilities }
  end
end
