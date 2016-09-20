require 'rails_helper'

RSpec.feature "User can search by zip" do
  scenario "user can enter a zip code and create a search" do
    # As a user
    # When I visit "/"
    visit '/'

    expect(page).to have_button("Search")
    # And I fill in a search box with "80202" and click "search"
    fill_in "zip_code_search", with: 80202
    click_on "Search"
    # Then my current path should be "/search" (ignoring params)
    expect(current_path).to eq("/search")
    # And I should see stores within 25 miles of 80202
    # And I should see a message that says "17 Total Stores"
    expect(page).to have_content("17 Total Stores")
    # And I should see exactly 15 results
    expect(page).to have_selector('stores', count: 15)
    # And I should see the long name, city, distance, phone number and store type for each of the 15 results
    expect(page).to have_content("Denver")
    expect(page).to have_content(3.25)
    expect(page).to have_content("Best Buy Mobile - Cherry Creek Shopping Center")
    expect(page).to have_content("303-270-9189")
    expect(page).to have_content("Mobile")

    expect(page).not_to have_content("Boulder")
    expect(page).not_to have_content(22.79)
    expect(page).not_to have_content("Best Buy - Boulder")
    expect(page).not_to have_content("303-938-2889")
    expect(page).not_to have_content("BigBox")
  end
end
