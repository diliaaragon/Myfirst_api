FactoryBot.define do
  factory :author do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    age { Faker::Number.between(20, 90) }
    nationality { Faker::Nation.nationality }
    published_book { Faker::Number.number(2) }
  end
end
