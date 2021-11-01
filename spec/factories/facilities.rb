FactoryGirl.define do
  factory :facility do
    name "MyString"
    description "MyText"
    rules "MyText"
    status false
    association :building
  end
end
