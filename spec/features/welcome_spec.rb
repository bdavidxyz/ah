require "rails_helper"

RSpec.feature "Welcome page", :type => :feature do
  scenario "User is on the welcome page by default" do
    visit root_path
    expect(page).to have_css("c-home-jumbotron")
  end
end
