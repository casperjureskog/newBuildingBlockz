FactoryGirl.define do
  factory :booking_stat do
    day ""
    week ""
    setting "MyString"
    association :facility
  end
end
