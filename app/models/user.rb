class User < ApplicationRecord
  # Necessary to authenticate.
  has_many :addresses
  has_many :orders
  has_secure_password
  
  before_validation {
    (self.email = self.email)
  }

  def set_verified
    self.is_verified = false
  end

  # Make sure email and username are present and unique.
  validates_presence_of     :email
  # validates_presence_of     :username
  # validates_uniqueness_of   :email
  # validates_uniqueness_of   :username
  # validates_presence_of :mobile_number
end
