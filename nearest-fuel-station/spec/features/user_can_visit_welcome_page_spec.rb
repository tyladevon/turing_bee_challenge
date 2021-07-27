require 'rails_helper'

fdescribe "user can visit the welcome page" do
  before do
    visit '/'
  end
  scenario "and see a dropdown menu" do
    expect(page).to have_content("Nearest Fuel Station")
    expect(page).to have_content("Search For The Nearest Electric Charging Station")
    expect(page).to have_button("Find Nearest Station")
  end

  scenario "and find a count of electric stations within 5 miles of Turing" do
    click_on "Find Nearest Station"

    expect(current_path).to eq search_path
    expect(page).to have_content 

    # And I select "Turing" from the start location drop down (Note: Use the existing search form)
    # And I click "Find Nearest Electric Station"
    # Then I should be on page "/search"


    # And I should see a count of Electric Stations within 5 miles of my location.
    # And I should see details about the five closest electric fuel stations to Turing, including their:

    # - Name
    # - Address
    # - Fuel Type
    # - Access Times
  end
end
