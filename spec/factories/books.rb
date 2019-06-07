FactoryBot.define do
  factory :book do
    title { "MyString" }
    presentation { "MyString" }
    edition { 1 }
    language { "MyString" }
    number_of_pages { 1 }
    ISBN { 1 }
  end
end
