require 'rails_helper'

describe "user can visit the welcome page" do
  before do
    visit '/'
  end
  scenario "and see a dropdown menu" do
    expect(page).to have_content("Nearest Fuel Station")
    expect(page).to have_content("Search For The Nearest Electric Charging Station")
    expect(page).to have_button("Find Nearest Station")
  end

  scenario "and can find electric stations within 5 miles of Turing" do
    click_on "Find Nearest Station"
    expect(current_path).to eq search_path
    
    within".navbar-search-results" do 
      expect(".name").to_not be_empty
      expect(".address").to_not be_empty
      expect(".access_times").to_not be_empty
      expect(".fuel_type").to_not be_empty
    end
  end
end
