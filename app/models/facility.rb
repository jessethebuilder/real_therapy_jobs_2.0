class Facility < ActiveRecord::Base

  validates :name, :presence => true

  belongs_to :company
  belongs_to :contact

  has_one :address, :as => :has_address, :dependent => :destroy

  validates :setting, :inclusion => {:in => setting_codes.map{ |i| i.to_s } + setting_codes}

  after_initialize do
    self.address ||= Address.new
  end

end
