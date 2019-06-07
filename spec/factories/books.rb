FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    presentation { "MyString" }
    edition { Faker::Number.number(1) }
    language { Faker::Nation.language }
    number_of_pages { Faker::Number.number(4) }
    ISBN { Faker::Number.number(10) }
  end
end
