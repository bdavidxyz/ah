require "rails_helper"

RSpec.feature "Question page", :type => :feature do

  context 'New attempt' do
    before do
      question = create(:question, :easy)    
      visit question_path(question.biz_id)
    end
    scenario "Display code editor" do
      expect(page).to have_css("#editor")
    end    
    scenario "Display test table" do
      expect(page).to have_css(".c-table")
    end    
    scenario "Display validation button" do
      expect(page).to have_css(".qa-validate")
    end    
    scenario "Display form fields" do
      expect(page).to have_css(".qa-form-fields")
    end    
    scenario "Do not display info that test is done" do
      expect(page).not_to have_css(".qa-info-done")
    end    
  end


  context 'Existing attempt' do
    cached_page = nil
    before do
      if !cached_page
        question = create(:question, :easy)    
        attempt = create(:attempt, question: question, status: "done", biz_id: fresh_and_new_attempt_id)    
        visit question_path(question.biz_id, for_id: attempt.biz_id)
        cached_page = Nokogiri::HTML(page.html)
      end
    end
    scenario "Do not display validation button" do
      expect(cached_page.css('.qa-validate').size).to eq(0)
    end
    scenario "Do not display form fields" do
      expect(cached_page.css('.qa-form-fields').size).to eq(0)
    end
    scenario "Display info that test is done" do
      expect(cached_page.css('.qa-info-done').size).to eq(1)
    end
  end

  private 

  def fresh_and_new_attempt_id
    SecureRandom.uuid
  end

end
