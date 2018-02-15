class QuestionController < ApplicationController

  def facile    
    populate_screen("facile")
  end

  def difficile   
    populate_screen("difficle")
  end

  def populate_screen(level)
    q = Question.first
    render 'question/show', locals: q.attributes.symbolize_keys
  end

  def validate_attempt
    params.inspect
    render 'final/index'
    # redirect_to final_index_path(for_id: 'blabla')
  end
end

