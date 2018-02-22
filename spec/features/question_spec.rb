require "rails_helper"

RSpec.feature "Question page", :type => :feature do

  context 'New attempt' do
    before(:each) do
      question = create(:question, :easy)    
      visit question_path(question.biz_id)
    end
    scenario "Display code editor" do
      expect(page).to have_css("#editor")
    end    
  end

  context 'Existing attempt' do
    
  end

  private 

  def fresh_and_new_attempt_id
    SecureRandom.uuid
  end

end
