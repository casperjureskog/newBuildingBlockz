class Workorder < ApplicationRecord
  validates_presence_of :title, :message, :location
  has_one :help_request
  belongs_to :building
end
