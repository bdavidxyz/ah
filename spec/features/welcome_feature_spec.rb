require "rails_helper"

RSpec.feature "Welcome page", :type => :feature do
  # before(:each) do
  #   create(:question, :easy)    
  #   create(:question, :hard)    
  #   visit root_path
  # end
  context 'Nominal' do
    seen = nil
    before do
      if !seen
        create(:question, :easy)    
        create(:question, :hard)    
        visit root_path
        seen = Nokogiri::HTML(page.html)
      end
    end
    scenario "Land on home page by default" do
      should_have seen, 1, '.c-home-jumbotron'
    end
    scenario "Show 'easy question' choice" do
      should_have seen, 1, 'a.qa-easy'
    end
    scenario "Show 'hard question' choices" do
      should_have seen, 1, 'a.qa-hard'
    end
    scenario "Goes to 'easy question' if clicked" do
      expect(seen.css('a.qa-easy')[0]["href"].split("=")[0]).to eq '/question/foo-bar-qix?for_id'
    end
    scenario "Goes to 'hard question' if clicked" do
      expect(seen.css('a.qa-hard')[0]["href"].split("=")[0]).to eq '/question/anagram-first-last?for_id'
    end    
  end
end
