require 'bcrypt'

class Company < ActiveRecord::Base

  attr_protected :encrypted_password
  validates :email, :name, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }, confirmation: true

  def password=(new_password)
  	@password = new_password
  	self.encrypted_password = BCrypt::Password.create(@password)
  end

  def password
  	@password
  end

  def valid_password?(password_to_validate)
  	puts password_to_validate
  	BCrypt::Password.new(encrypted_password) == password_to_validate
  end

end
