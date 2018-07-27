require 'rails_helper'

describe "a user" do
  describe 'visits the trip index page' do
    it 'sees trips with all trip info' do
      trip_1 = Trip.create(name: 'A long and winding road', start_date: Date.today, end_date: Date.today)
      trip_2 = Trip.create(name: 'A song and finding road', start_date: Date.today, end_date: Date.today)

      visit trips_path

      expect(page).to have_content('A long and winding road')
      expect(page).to have_content('A song and finding road')
    end
  end
end
