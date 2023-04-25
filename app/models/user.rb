class User < ApplicationRecord
  validates_uniqueness_of :email

  has_secure_password
  
  validates_presence_of :password, :password_confirmation

end