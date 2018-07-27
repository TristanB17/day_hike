require 'rails_helper'

describe Trip, type: :model do
  describe 'calculations' do
    it '#total_distance' do
      trip = Trip.create(name: 'A long and winding road', start_date: Date.today, end_date: Date.today)
      trail_1 = trip.trails.create(name: 'Trail by Fire', address: 'somewhere', length: 20)
      trail_2 = trip.trails.create(name: 'Trail by Combat', address: 'somewhere', length: 10)
      expected_total = 30
      expected_average = 15

      expect(trip.total_distance).to eq(expected_total)
      expect(trip.average_distance).to eq(expected_average)
    end
  end
end
