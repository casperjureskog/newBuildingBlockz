FactoryGirl.define do
  factory :booking do
    name "MyString"
    start_time "2017-04-24 17:09:58"
    end_time "23"
    association :facility
    association :building
    association :user
  end
end
