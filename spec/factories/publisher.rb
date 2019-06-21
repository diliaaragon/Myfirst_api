FactoryBot.define do
  factory :publisher do
    name { Faker::Name.initials(4) }
    foundation { Faker::Number.between(1455, 2019) }
    country { Faker::WorldCup.team }
  end
end
