class Book < ApplicationRecord
  validates :title, presence: true
  validates :edition, presence: true
  validates :lenguage,  presence: true
  validates :ISBN, presence: true, uniqueness: true
end
