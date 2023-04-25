class User < ApplicationRecord
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates_confirmation_of :password

end