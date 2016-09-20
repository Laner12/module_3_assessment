require 'rails_helper'

RSpec.feature "User can search by zip" do
  scenario "user can enter a zip code and create a search" do
    visit '/'

    expect(page).to have_button("Search")

    fill_in "zip_code_search", with: 80202
    click_on "Search"

    expect(current_path).to eq("/search")
    expect(page).to have_content("Denver")
    expect(page).to have_content(3.25)
    expect(page).to have_content("Best Buy Mobile - Cherry Creek Shopping Center")
    expect(page).to have_content("303-270-9189")
    expect(page).to have_content("Mobile")

    expect(page).not_to have_content("Boulder")
    expect(page).not_to have_content(22.79)
    expect(page).not_to have_content("Best Buy - Boulder")
    expect(page).not_to have_content("303-938-2889")
  end
end
