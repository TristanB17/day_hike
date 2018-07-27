require 'rails_helper'

describe "a user" do
  describe 'visits the trip index page' do
    it 'sees trips with all trip info' do
      trip = Trip.create(name: 'A long and winding road', start_date: Date.today, end_date: Date.today)
      trail_1 = trip.trails.create(name: 'Trail by Fire', address: 'somewhere', length: 20)
      trail_2 = trip.trails.create(name: 'Trail by Combat', address: 'somewhere', length: 10)

      visit trip_path(trip)

      expect(page).to have_content(trail_1.name)
      expect(page).to have_content(trail_1.address)
      expect(page).to have_content(trail_1.length)
      expect(page).to have_content(trail_2.name)
      expect(page).to have_content(trail_2.address)
      expect(page).to have_content(trail_2.length)
    end
    it 'sees trips with total and average trail distance' do
      trip = Trip.create(name: 'A long and winding road', start_date: Date.today, end_date: Date.today)
      trail_1 = trip.trails.create(name: 'Trail by Fire', address: 'somewhere', length: 20)
      trail_2 = trip.trails.create(name: 'Trail by Combat', address: 'somewhere', length: 10)
      expected_total = 30
      expected_average = 15

      visit trip_path(trip)

      expect(page).to have_content(expected_total)
      expect(page).to have_content(expected_average)
    end
    it 'sees longest and shortest trails' do
      trip = Trip.create(name: 'A long and winding road', start_date: Date.today, end_date: Date.today)
      trail_1 = trip.trails.create(name: 'Trail by Fire', address: 'somewhere', length: 20)
      trail_2 = trip.trails.create(name: 'Trail by Combat', address: 'somewhere', length: 10)

      visit trip_path(trip)

      expect(page).to have_content("Longest Distance: #{trail_1.length}")
      expect(page).to have_content("Shortest Distance: #{trail_2.length}")
    end
  end
end
