require 'rails_helper'

RSpec.describe Facility, :type => :model do
  describe 'Validations' do
    it{ should validate_presence_of :name }
    it{ should validate_inclusion_of(:setting).in_array(setting_codes) }
  end

  describe 'Associations' do
    it{ should belong_to :company }
    it{ should belong_to :contact }

    it{ should have_one :address}

    specify 'if no address exists, create one' do
      f = Facility.new
      f.address.class.should == Address
    end
  end

  describe 'Methods' do
  end
end
