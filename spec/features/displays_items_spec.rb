require 'rails_helper'

RSpec.feature "Display Items" do
  scenario "can view items" do
    visit '/'

    expect(page).to have_http_status(200)

    within('h1') do
      expect(page).to have_content('Items')
    end
  end
end
