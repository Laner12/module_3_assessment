require 'rails_helper'

RSpec.feature "User can search by zip" do
  scenario "user can enter a zip code and create a search" do
    # As a user
    # When I visit "/"
    visit '/'

    expect(page).to have_content("Search")
    # And I fill in a search box with "80202" and click "search"
    fill_in "Search by zip", with: 80202
    click_on "Search"
    # Then my current path should be "/search" (ignoring params)
    expect(current_path).to eq("/search")
    # And I should see stores within 25 miles of 80202
    # And I should see a message that says "17 Total Stores"
    expect(page).to have_content("17 Total Stores")
    # And I should see exactly 15 results
    expect(page).to have_selector('stores', count: 15)
    # And I should see the long name, city, distance, phone number and store type for each of the 15 results
  end
end
# should see
# "city": "Denver",
# "distance": 3.25,
# "longName": "Best Buy Mobile - Cherry Creek Shopping Center",
# "phone": "303-270-9189",
# "storeType": "Mobile"
# },
# {
# "city": "Lakewood",
# "distance": 5.28,
# "longName": "Best Buy - Belmar",
# "phone": "303-742-8039",
# "storeType": "BigBox"
# },

# should not see
# "city": "Parker",
# "distance": 20.85,
# "longName": "Best Buy - Parker",
# "phone": "303-840-5501",
# "storeType": "BigBox"
# },
# {
# "city": "Boulder",
# "distance": 22.79,
# "longName": "Best Buy - Boulder",
# "phone": "303-938-2889",
# "storeType": "BigBox"
