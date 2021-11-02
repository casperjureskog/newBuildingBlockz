class News < ApplicationRecord
  validates_presence_of :title, :description
  belongs_to :building
end
