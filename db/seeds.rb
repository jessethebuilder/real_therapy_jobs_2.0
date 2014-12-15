10.times do
  c = Company.new :name => Faker::Company.name
  c.save!
end

50.times do
  con = Contact.new :name => Faker::Company.name
  con.company = Company.all.sample
  con.save!
end

100.times do
  f = Facility.new :name => Faker::Company.name
  f.address = Address.new :street => Faker::Address.street_address, :city => Faker::Address.city, :state => Faker::Address.state, :zip => Faker::Address.zip
  f.contact = Contact.all.sample
  f.setting = CLINICAL_SETTINGS.keys.sample
  f.save!
end

