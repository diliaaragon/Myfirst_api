require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:author){ FactoryBot.create(:author) }

  describe 'validations' do
    subject { create(:book, author_id: author.id) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:edition) }
    it { is_expected.to validate_presence_of(:language) }
    it { is_expected.to validate_presence_of(:ISBN) }
    it { is_expected.to validate_uniqueness_of(:ISBN) }
  end

  describe 'Associations' do
    subject { create(:book, author_id: author.id) }

    it { is_expected.to belong_to(:author) }
  end
end
