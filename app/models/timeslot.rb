class Timeslot < ApplicationRecord
  belongs_to :facility
  belongs_to :building
end
