require 'rails_helper'

RSpec.describe Publisher, type: :model do
  it 'is valid with name, foundation, country' do
    publisher = build(:publisher)
    expect(publisher).to be_valid
  end

  it 'is invalid without name' do
    publisher = build(:publisher, name: nil)
    expect(publisher).to_not be_valid
  end

  it 'is invalid if name that less than four characters' do
    publisher = build(:publisher, name: 'num')
    expect(publisher).to_not be_valid
  end

  it 'is invalid if the name already exist' do
    publisher_create = create(:publisher, name: 'norma')
    publisher = build(:publisher, name: 'norma')
    expect(publisher).to_not be_valid
  end

  it 'is invalid without foundation' do
    publisher = build(:publisher, foundation: nil)
    expect(publisher).to_not be_valid
  end

  it 'is invalid if the year of foundation is greater than 2019' do
    publisher = build(:publisher, foundation: 2020)
    expect(publisher).to_not be_valid
  end

  it 'is invalid without country' do
    publisher = build(:publisher, country: nil)
    expect(publisher).to_not be_valid
  end
end
