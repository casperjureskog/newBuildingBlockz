class HelpRequest < ApplicationRecord
  validates_presence_of :title, :message
  has_one :workorder, :dependent => :destroy
  belongs_to :user
  belongs_to :building
end
