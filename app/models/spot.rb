class Spot < ActiveRecord::Base
  belongs_to :photos
  belongs_to :user
end
