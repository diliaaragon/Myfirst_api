require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { FactoryBot.create(:book) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:edition) }
    it { is_expected.to validate_presence_of(:language) }
    it { is_expected.to validate_presence_of(:ISBN) }
    it { is_expected.to validete_uniqueness_of(:ISBN) }
  end
end