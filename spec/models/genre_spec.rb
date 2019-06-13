require 'rails_helper'

RSpec.describe Genre, type: :model do
  subject {  FactoryBot.create(:genre) }

  describe 'validate' do
    it {is_expected.to validate_presence_of(:name) }
  end
end
