require "rails_helper"

RSpec.feature "Question page", :type => :feature do

  context 'New attempt' do
    seen = nil
    before do
      if !seen
        question = create(:question, :easy)    
        visit question_path(question.biz_id)
        seen = Nokogiri::HTML(page.html)
      end
    end
    scenario "Display an enabled editor" do
      should_have seen, 1, '.enabled-editor'
    end    
    scenario "Display code editor" do
      should_have seen, 1, '#editor'
    end    
    scenario "Display test table" do
      should_have seen, 1, '.c-table'
    end    
    scenario "Display validation button" do
      should_have seen, 1, '.qa-validate'
    end    
    scenario "Display form fields" do
      should_have seen, 1, '.qa-form-fields'
    end    
    scenario "Do not display info that test is done" do
      should_have seen, 0, '.qa-info-done'
    end    
  end


  context 'Existing attempt' do
    seen = nil
    before do
      if !seen
        question = create(:question, :easy)    
        attempt = create(:attempt, question: question, status: "done", biz_id: fresh_and_new_attempt_id)    
        visit question_path(question.biz_id, for_id: attempt.biz_id)
        seen = Nokogiri::HTML(page.html)
      end
    end
    scenario "Display an disabled editor" do
      should_have seen, 1, '.disabled-editor'
    end    
    scenario "Do not display validation button" do
      should_have seen, 0, '.qa-validate'
    end
    scenario "Do not display form fields" do
      should_have seen, 0, '.qa-form-fields'
    end
    scenario "Display info that test is done" do
      should_have seen, 1, '.qa-info-done'
    end
    scenario "Display test table" do
      should_have seen, 1, '.c-table'
    end    
  end

  private 

  def should_have(seen, size, selector)
    expect(seen.css(selector).size).to eq(size)
  end

  def fresh_and_new_attempt_id
    SecureRandom.uuid
  end

end
