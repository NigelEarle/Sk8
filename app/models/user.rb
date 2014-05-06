require "bcrypt"

PASSWORD_RESET_EXPIRES = 4

class User < ActiveRecord::Base

  attr_accessor :password, :password_confirmation

  before_save :encrypt_password
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :password, confirmation: true

  has_many :spots
  has_many :comments

  def self.authenticate(email, password)
    user = User.find_by email: email
    if user and user.authenticate(password)
      user
    else
      nil
    end
  end

  def authenticate(password)
    self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end

  def self.find_by_code code
    if @user = User.find_by(:code => code)
      if @user.expires_at >= Time.now.gmtime
        @user
      else
        nil
      end
    else
      nil
    end
  end

  def set_password_reset
    self.code = SecureRandom.urlsafe_base64
    set_expiration
  end

  def set_expiration
    self.expires_at = PASSWORD_RESET_EXPIRES.hours.from_now
    self.save
  end

  def reset_password(params)
    if params[:password].blank?
      self.errors.add(:password, "can't be blank")
      false
    else
      if self.update_attributes(params)
        self.update_attributes(params.merge( code: nil, expires_at: nil ))
      end
    end
  end

  protected

  def set_random_password
    if self.fish.blank? and self.password.blank?
      self.salt = BCrypt::Engine.generate_salt
      self.fish = BCrypt::Engine.hash_secret(SecureRandom.base64(32), self.salt)
    end
  end

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.fish = BCrypt::Engine.hash_secret(password, self.salt)
    end
  end
end


