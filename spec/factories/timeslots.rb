FactoryGirl.define do
  factory :timeslot do
    start_time "10:00"
    end_time "12:00"
    association :facility
    association :building
  end
end
