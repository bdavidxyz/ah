require "rails_helper"

RSpec.feature "Welcome page", :type => :feature do
  before(:each) do
    create(:question, :easy)    
    create(:question, :hard)    
  end
  scenario "Land on home page by default" do
    visit root_path
    expect(page).to have_css(".c-home-jumbotron")
  end
end
