class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true, length: { minimum: 4 }
  validates :last_name, presence: true, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: true 

  def to_token_payload
    {
      sub: id,
      email: email
    }
  end
end
