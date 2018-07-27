require 'rails_helper'

describe Trip, type: :model do
  describe 'calculations' do
    it '#total_distance + #total_average' do
      trip = Trip.create(name: 'A long and winding road', start_date: Date.today, end_date: Date.today)
      trail_1 = trip.trails.create(name: 'Trail by Fire', address: 'somewhere', length: 20)
      trail_2 = trip.trails.create(name: 'Trail by Combat', address: 'somewhere', length: 10)
      expected_total = 30
      expected_average = 15

      expect(trip.total_distance).to eq(expected_total)
      expect(trip.average_distance).to eq(expected_average)
    end
    it '#longest_trail + #shortest_trail' do
      trip = Trip.create(name: 'A long and winding road', start_date: Date.today, end_date: Date.today)
      trail_1 = trip.trails.create(name: 'Trail by Fire', address: 'somewhere', length: 40)
      trail_2 = trip.trails.create(name: 'Trail by Combat', address: 'somewhere', length: 15)
      expected_longest = 40
      expected_average = 15

      expect(trip.longest_trail).to eq(expected_longest)
      expect(trip.shortest_trail).to eq(expected_shortest)
    end
  end
end
