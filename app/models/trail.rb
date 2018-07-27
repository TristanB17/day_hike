class Trail < ApplicationRecord
  validates_presence_of :length, :name, :address

  has_many :trip_trails
  has_many :trips, through: :trip_trails
end
