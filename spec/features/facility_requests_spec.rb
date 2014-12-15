require 'rails_helper'

RSpec.describe "Facility Requests", :type => :feature do
  describe 'Creating a Facility' do
  let(:facility){ build :facility}

    specify 'contact_id select should update when company_id is updated' do
     ## f = FactoryGirl.create :facility_with_contact
     ## other_contact = FactoryGirl.create :contact_with_company
     ## visit 'facilities/new'
     ## find('#facility_company_id')

    end

    describe 'Index Requests' do
      describe 'Facilities Table' do
        let!(:facility1){ create :complete_facility }
        let!(:facility2){ create :complete_facility }

        it 'should sort by column ASC when column title is clicked' do
          facility1.update_attribute(:name, "Apple")
          facility2.update_attribute(:name, "Zoolander")

          visit 'facilities'
          within('thead') do
            click_link 'Name'
          end

          all('.table tr > td:nth-child(1)').first.text.should == "Apple"
        end

        it 'should save sorting choices between requests' do
          facility1.update_attribute(:name, "Apple")
          facility2.update_attribute(:name, "Zoolander")

          visit 'facilities'
          within('thead') do
            click_link 'Name'
          end

          3.times do
            visit 'facilities'
          end

          all('.table tr > td:nth-child(1)').first.text.should == "Apple"
        end

        it 'should sort by column DESC when column title is clicked a second time' do
          facility1.update_attribute(:name, "Apple")
          facility2.update_attribute(:name, "Zoolander")

          visit 'facilities'
          within('thead') do
            click_link 'Name'
            click_link 'Name'
          end

          all('.table tr > td:nth-child(1)').first.text.should == "Zoolander"

        end

        it 'should work on associated columns such as #state' do
          facility1 = FactoryGirl.create :facility_with_address
          facility2 = FactoryGirl.create :facility_with_address

          facility1.address.update_attribute(:state, 'az')
          facility2.address.update_attribute(:state, 'wy')

          visit 'facilities'
          within('thead') do
            click_link 'State'
          end

          all('.table tr > td:nth-child(3)').first.text.should == "Arizona"

          within('thead') do
            click_link 'State'
          end

          all('.table tr > td:nth-child(3)').first.text.should == "Wyoming"
        end

        it 'should default to order ASC if new column is selected' do
          facility1 = FactoryGirl.create :facility_with_address
          facility2 = FactoryGirl.create :facility_with_address
          facility1.update_attribute(:name, 'Yule Tide')
          facility1.address.update_attribute(:state, 'wa')
          facility2.update_attribute(:name, 'Aarons')
          facility2.address.update_attribute(:state, 'az')

          visit 'facilities'

          within('thead') do
            click_link 'Name'
            click_link 'State'
          end

          all('.table tr > td:nth-child(3)').first.text.should == 'Arizona'
        end

        it 'should have visual arrows to indicate the order direction' do

        end

        it 'should automatically secondary order on city if ordered on state' do
          facility1 = FactoryGirl.create :facility_with_address
          facility2 = FactoryGirl.create :facility_with_address
          facility1.address.update_attribute(:state, 'ga')
          facility2.address.update_attribute(:state, 'ga')
          facility1.address.update_attribute(:city, 'Rome')
          facility2.address.update_attribute(:city, 'Atlanta')

          visit 'facilities'

          within('thead') do
            click_link 'State'
          end

          all('.table tr > td:nth-child(2)').first.text.should == 'Atlanta'
        end
      end
    end
  end
end