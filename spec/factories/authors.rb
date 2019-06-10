FactoryBot.define do
  factory :author do
    name { Faker::Book.author }
    age { Faker::Number.between(20, 90) }
    natinality { Faker::Nation.nationality }
    published_book { Faker::Number.number(2) }
  end
end
