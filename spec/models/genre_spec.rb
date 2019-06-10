require 'rails_helper'

RSpec.describe Genre, type: :model do
  it 'is valid with name' do
    genre = build(:genre)
    expect(genre).to be_valid
  end

  it 'is invalid with name that already exist' do
    genre_create = create(:genre, name: 'literary')
    genre = build(:genre, name: 'literary')
    expect(genre).to_not be_valid
  end
end
