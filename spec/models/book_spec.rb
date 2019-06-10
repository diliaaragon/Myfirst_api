require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'is valid with title, edition, lenguage, ISBN' do
    book = build(:book)
    expect(book).to be_valid
  end

  it 'is invalid without title' do
    book = build(:book, title: nil)
    expect(book).to_not be_valid
  end

  it 'is invalid without edition' do
    book = build(:book, edition: nil)
    expect(book).to_not be_valid
  end

  it 'is invalid without language' do
    book = build(:book, language: nil)
    expect(book).to_not be_valid
  end

  it 'is invalid without ISBN' do
    book = build(:book, ISBN: nil)
    expect(book).to_not be_valid
  end

  it 'is invalid with ISBN that already exist' do
    book_create = create(:book, ISBN: 1234567891)
    book = build(:book, ISBN: 1234567891)
    expect(book).to_not be_valid
  end
end
