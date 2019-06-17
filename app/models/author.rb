class Author < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 4 }
  validates :last_name, presence: true, length: { minimum: 4 }
  validates :age, presence: true
  validates :nationality, presence: true
end