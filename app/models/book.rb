class Book < ApplicationRecord
  validates :title, precense: true, uniqueness: true
  validates :edition, precense: true
  validates :lenguage,  precense: true
  validate :ISBN, precense: true
end
