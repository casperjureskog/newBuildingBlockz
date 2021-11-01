FactoryGirl.define do
  factory :help_request do
    title "MyString"
    message "MyString"
    urgent true
    association :user
    association :building
  end
end
