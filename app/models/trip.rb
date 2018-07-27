class Trip < ApplicationRecord
  validates_presence_of :name, :start_date, :end_date

  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def total_distance
    trails.sum(:length)
  end

  def average_distance
    trails.average(:length)
  end

  def longest_trail
    trails.order(length: :desc)[0]
  end

  def shortest_trail
    trails.order(length: :asc)[0]
  end
end
