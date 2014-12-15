json.array!(@facilities) do |facility|
  json.extract! facility, :id, :name, :contact_id, :company_id, :setting
  json.url facility_url(facility, format: :json)
end
