FactoryGirl.define do
  factory :post do
    title     { Faker::Superhero.name }
    subheader { Faker::StarWars.quote }
    content   { Faker::Lorem.paragraphs(2) }
  end
end
