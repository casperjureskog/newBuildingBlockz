class Facility < ApplicationRecord
  validates_presence_of :name, :description
  has_many :bookings, :dependent => :destroy
  has_many :booking_stat, :dependent => :destroy
  has_many :timeslots, :dependent => :destroy
  has_many :timelists, :dependent => :destroy
  belongs_to :building

  def self.start_time
   [ 1 , 2 , 3 , 4 , 5 , 6 ,
    7 , 8 , 9 , 10 , 11 , 12 ,
    13 , 14 , 15 , 16 , 17 , 18 ,
    19 , 20 , 21 , 22 , 23 , 00 ]
  end

  def self.time_slot
    [1, 2, 3, 4, 5, 6]
  end

  def self.hours
    [1, 2, 3, 4]
  end

  def self.timelist
  ['05:00:00',
      '05:30:00',
      '06:00:00',
      '06:30:00',
      '07:00:00',
      '07:30:00',
      '08:00:00',
      '08:30:00',
      '09:00:00',
      '09:30:00',
      '10:00:00',
      '10:30:00',
      '11:00:00',
      '11:30:00',
      '12:00:00',
      '12:30:00',
      '13:00:00',
      '13:30:00',
      '14:00:00',
      '14:30:00',
      '15:00:00',
      '15:30:00',
      '16:00:00',
      '16:30:00',
      '17:00:00',
      '17:30:00',
      '18:00:00',
      '18:30:00',
      '19:00:00',
      '19:30:00',
      '20:00:00',
      '20:30:00',
      '21:00:00',
      '21:30:00',
      '22:00:00',
      '22:30:00',
      '23:00:00',
      '23:30:00',
      '24:00:00']
  end
end
