FactoryGirl.define do
  factory :workorder do
    title "MyString"
    message "MyString"
    location "MyString"
    urgent false
    status "MyString"
    association :building
  end
end
