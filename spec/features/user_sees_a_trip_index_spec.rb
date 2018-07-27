require 'rails_helper'

describe "a user" do
  describe 'visits the trip index page' do
    it 'sees trips with all trip info' do
      trip_1 = Trip.create(name: 'A long and winding road', start_date: Date.today, end_date: Date.today)
      trip_2 = Trip.create(name: 'A song and finding road', start_date: Date.today, end_date: Date.today)

      visit trips_path

      expect(page).to have_link(trip_1.name)
      expect(page).to have_link(trip_2.name)
      expect(page).to have_content(trip_1.start_date)
      expect(page).to have_content(trip_1.end_date)
      expect(page).to have_content(trip_2.start_date)
      expect(page).to have_content(trip_2.end_date)
    end
    it 'sees a single trip with all trip info' do
      trip_1 = Trip.create(name: 'A long and winding road', start_date: Date.today, end_date: Date.today)
      trip_2 = Trip.create(name: 'A song and finding road', start_date: Date.today, end_date: Date.today)
      trail_1 = trip_1.trails.create(name: 'Trail by Fire', address: 'somewhere', length: 20)
      trail_2 = trip_2.trails.create(name: 'Trail by Combat', address: 'somewhere', length: 10)

      visit trips_path

      click_link trip_1.name

      expect(current_path).to eq(trip_path(trip_1))
      expect(page).to have_content(trip_1.name)
      expect(page).to have_content(trip_1.start_date)
      expect(page).to have_content(trip_1.end_date)
    end
  end
end
