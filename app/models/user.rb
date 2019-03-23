class User < ApplicationRecord
  # Necessary to authenticate.
  has_many :addresses
  has_many :orders
  has_secure_password

  # Basic password validation, configure to your liking.
  validates_length_of       :password, maximum: 72, minimum: 8, allow_nil: false, allow_blank: false
  validates_confirmation_of :password, allow_nil: false, allow_blank: false

  before_validation {
    (self.email = self.email)
  }

  # Make sure email and username are present and unique.
  validates_presence_of     :email
  # validates_presence_of     :username
  # validates_uniqueness_of   :email
  # validates_uniqueness_of   :username
  # validates_presence_of :mobile_number
end
