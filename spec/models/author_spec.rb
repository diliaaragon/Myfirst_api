require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'is valid with first_name, las_name, age and nationality' do
    author = build(:author)
    expect(author).to be_valid
  end

  it 'is invalid without first_name' do
    author = build(:author, first_name: nil)
    expect(author).to_not be_valid
  end

  it 'is invalid if first_name has less than four characters' do
    author = build(:author, first_name: 'dan')
    expect(author).to_not be_valid
  end

  it 'is invalid without last_name' do
    author = build(:author, last_name: nil)
    expect(author).to_not be_valid
  end

  it 'is invalid if last_name has less than four characters' do
    author = build(:author, last_name: 'dan')
    expect(author).to_not be_valid
  end

  it 'is invalid without age' do
    author = build(:author, age: nil)
    expect(author).to_not be_valid
  end

  it 'is invalid without nationality' do
    author = build(:author, nationality: nil)
    expect(author).to_not be_valid
  end

end
