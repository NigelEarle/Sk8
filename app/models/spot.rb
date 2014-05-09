class Spot < ActiveRecord::Base

  belongs_to :user

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  validates :name, presence: :true, uniqueness: {case_sensitive: true}
  validates :address, presence: :true, uniqueness: {case_sensituve: true}

end
