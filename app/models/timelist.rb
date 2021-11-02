class Timelist < ApplicationRecord
  belongs_to :facility

  def self.start_end
   [ 1 , 2 , 3 , 4 , 5 , 6 ,
     7 , 8 , 9 ,10 , 11 , 12 ,
     13 , 14 , 15 , 16 , 17 , 18 ,
     19 , 20 , 21 , 22 , 23 , 00 ]
  end

  def self.minutes_gap
   [ 10 , 15 , 30 , 60 ]
  end
end
