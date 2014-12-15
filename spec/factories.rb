FactoryGirl.define do

  factory :company do
    name Faker::Business.name
  end

  factory :contact do
    name Faker::Name.name

    factory :contact_with_company do
      company
    end
  end


  factory :facility do
    name Faker::Business.name
    setting setting_codes.sample

    factory :facility_with_contact do
      contact_with_company
    end

    factory :facility_with_address do
      address
    end

    factory :complete_facility do
      contact
    end
  end


  factory :address do

  end
end