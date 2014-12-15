class Company < ActiveRecord::Base
  validates :name, :presence => true

  has_many :contacts
  has_many :facilities
end
