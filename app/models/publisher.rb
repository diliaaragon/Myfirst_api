class Publisher < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :foundation, presence: true, numericality: { less_than_or_equal_to: 2019 }
  validates :country, presence: true
end
