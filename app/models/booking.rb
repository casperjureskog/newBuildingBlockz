class Booking < ApplicationRecord
  belongs_to :facility
  belongs_to :building
  belongs_to :user
end
