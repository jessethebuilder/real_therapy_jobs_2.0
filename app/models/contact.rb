class Contact < ActiveRecord::Base
  validates :name, :presence => true

  belongs_to :company

  has_many :facilities
end
