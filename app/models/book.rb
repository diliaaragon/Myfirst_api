class Book < ApplicationRecord
  belongs_to :author

  validates :title, presence: true
  validates :edition, presence: true
  validates :language,  presence: true
  validates :ISBN, presence: true, uniqueness: true
end
