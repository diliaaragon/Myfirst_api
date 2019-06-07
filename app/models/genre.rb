class Genre < ApplicationRecord
  validate :name, presence: true, uniqueness: true
end
