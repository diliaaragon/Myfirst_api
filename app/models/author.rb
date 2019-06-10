class Author < ApplicationRecord
  validate :first_name, presence: true, length: { minimun: 4 }
  validate :last_name, presence: true, length: { minimun: 4 }
  validate :age, presence: true
  validate :natinality, presence: true
end
