class Comment < ActiveRecord::Base

  attr_accessor :avatar

  belongs_to :user
  belongs_to :spot

  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
