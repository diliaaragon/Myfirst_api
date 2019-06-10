class Publisher < ApplicationRecord
  validate :name, presence: true, uniqueness: true, length: { minimun: 4 }
  validate :foundation, presence: true, numericality: { less_than_or_equal_to: 2019 }
  validate :country, presence: true
end
