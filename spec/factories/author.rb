require 'faker'

FactoryBot.define do
  factory :author do
    first_name { Faker::Name.initials(4) }
    last_name { Faker::Name.initials(4) }
    age { Faker::Number.between(20, 90) }
    nationality { Faker::Nation.nationality }
    published_book { Faker::Number.number(2) }
  end
end
