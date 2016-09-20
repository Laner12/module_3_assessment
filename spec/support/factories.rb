FactoryGirl.define do
  factory :item do
    name { Faker::Name.name }
    description "this"
    image_url "sahtsla.png"
  end
end
