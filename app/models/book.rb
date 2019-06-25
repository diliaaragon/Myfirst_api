class Book < ApplicationRecord

  has_and_belongs_to_many :genres

  validates :title, presence: true
  validates :edition, presence: true
  validates :language,  presence: true
  validates :ISBN, presence: true, uniqueness: true
end
