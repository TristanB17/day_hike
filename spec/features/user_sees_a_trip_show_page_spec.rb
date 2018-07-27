require 'rails_helper'

describe "a user" do
  describe 'visits the trip index page' do
    it 'sees trips with all trip info' do
      trip = Trip.create(name: 'A long and winding road', start_date: Date.today, end_date: Date.today)
      trail_1 = trip.trails.create(name: 'Trail by Fire', address: 'somewhere', length: 20)
      trail_2 = trip.trails.create(name: 'Trail by Combat', address: 'somewhere', length: 10)

      visit trip_path(trip_1)

      expect(page).to have_content(trail_1.name)
      expect(page).to have_content(trail_1.address)
      expect(page).to have_content(trail_1.length)
      expect(page).to have_content(trail_2.name)
      expect(page).to have_content(trail_2.address)
      expect(page).to have_content(trail_2.length)
    end
  end
end
