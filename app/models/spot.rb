class Spot < ActiveRecord::Base

  belongs_to :user
  has_many :comments

  geocoded_by :address
  after_validation :geocode, :if => lambda{ |obj| obj.address? }

  validates :name, presence: :true, uniqueness: {case_sensitive: true}
  # validates :address, presence: :true, uniqueness: {case_sensituve: true}

end
