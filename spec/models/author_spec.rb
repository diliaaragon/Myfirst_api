require 'rails_helper'

RSpec.describe Author, type: :model do
  subject { FactoryBot.create(:author) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_length_of(:first_name).is_at_least(4) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:last_name).is_at_least(4) }
    it { is_expected.to validate_presence_of(:age) }
    it { is_expected.to validate_presence_of(:nationality) }
  end
end
