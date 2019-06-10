FactoryBot.define do
  factory :publisher do
    name { Faker::Book.publisher }
    foundation { Faker::Number.between(1455, 2019) }
    country { Faker::WorldCup.team }
  end
end
