require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { FactoryBot.create(:book) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:edition) }
    it { is_expected.to validate_presence_of(:language) }
    it { is_expected.to validate_presence_of(:ISBN) }
    it { is_expected.to validate_uniqueness_of(:ISBN) }
  end

  describe 'association' do
    it { is_expected.to have_and_belong_to_many(:genres) }
  end
end
