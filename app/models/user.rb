class User < ApplicationRecord
  validates :first_name, presences: true, length: { minimum: 4 }
  validates :last_name, presences: true, length: { minimum: 4 }
  validates :email, presences: true, uniqueness: true 
end
