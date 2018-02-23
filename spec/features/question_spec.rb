require "rails_helper"

RSpec.feature "Question page", :type => :feature do

  context 'New attempt' do
    that = nil
    before do
      if !that
        question = create(:question, :easy)    
        visit question_path(question.biz_id)
        that = Nokogiri::HTML(page.html)
      end
    end
    scenario "Display an enabled editor" do
      expect(that.css('.enabled-editor').size).to eq(1)
    end    
    scenario "Display code editor" do
      expect(that.css('#editor').size).to eq(1)
    end    
    scenario "Display test table" do
      expect(that.css('.c-table').size).to eq(1)
    end    
    scenario "Display validation button" do
      expect(that.css('.qa-validate').size).to eq(1)
    end    
    scenario "Display form fields" do
      expect(that.css('.qa-form-fields').size).to eq(1)
    end    
    scenario "Do not display info that test is done" do
      expect(that.css('.qa-info-done').size).to eq(0)
    end    
  end


  context 'Existing attempt' do
    that = nil
    before do
      if !that
        question = create(:question, :easy)    
        attempt = create(:attempt, question: question, status: "done", biz_id: fresh_and_new_attempt_id)    
        visit question_path(question.biz_id, for_id: attempt.biz_id)
        that = Nokogiri::HTML(page.html)
      end
    end
    scenario "Display an disabled editor" do
      expect(that.css('.disabled-editor').size).to eq(1)
    end    
    scenario "Do not display validation button" do
      expect(that.css('.qa-validate').size).to eq(0)
    end
    scenario "Do not display form fields" do
      expect(that.css('.qa-form-fields').size).to eq(0)
    end
    scenario "Display info that test is done" do
      expect(that.css('.qa-info-done').size).to eq(1)
    end
    scenario "Display test table" do
      # expect(that.css('.c-table').size).to eq(1)
      should_have(that, '.c-table', 1)
    end    
  end

  private 

  def should_have(that, selector, size)
    expect(that.css(selector).size).to eq(size)
  end

  def fresh_and_new_attempt_id
    SecureRandom.uuid
  end

end
