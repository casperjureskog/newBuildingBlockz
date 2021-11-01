class Building < ApplicationRecord
  has_many :bookings
  has_many :facilities
  has_many :help_requests
  has_many :news
  has_many :timeslots
  has_many :users
  has_many :workorders
end
