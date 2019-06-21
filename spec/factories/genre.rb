FactoryBot.define do
  factory :genre do
    sequence(:name) { |n| "Caspian Star #{n}" }
  end
end

