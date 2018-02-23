require "rails_helper"

RSpec.feature "Welcome page", :type => :feature do
  before(:each) do
    create(:question, :easy)    
    create(:question, :hard)    
    visit root_path
  end
  scenario "Land on home page by default" do
    expect(page).to have_css(".c-home-jumbotron")
  end
  scenario "Show 'easy question' and 'hard question' choices" do
    expect(page).to have_css("a.qa-easy")
    expect(page).to have_css("a.qa-hard")
  end
  scenario "Goes to 'easy question' if clicked" do
    find("a.qa-easy").click
    expect(current_path).to eq("/question/foo-bar-qix")
  end
  scenario "Goes to 'hard question' if clicked" do
    find("a.qa-hard").click
    expect(current_path).to eq("/question/anagram-first-last")
  end
end
