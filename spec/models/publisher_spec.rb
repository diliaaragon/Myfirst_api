require 'rails_helper'

RSpec.describe Publisher, type: :model do
  subject { FactoryBot.create(:publisher) }

  describe  'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(4) }
    it { is_expected.to validate_presence_of(:foundation) }
    it { is_expected.to validate_numericality_of(:foundation).is_less_than_or_equal_to(2019)}
  end

  describe 'association' do
    it { is_expected.to have_many(:book) }
  end
end
