FactoryGirl.define do
  factory :news do
    title "MyString"
    description "MyText"
    association :building
  end
end
