class QuestionController < ApplicationController

  def facile    
    populate_screen("facile")
  end

  def difficile   
    populate_screen("difficile")
  end

  def populate_screen(level)
    q = {}
    q = Question.easy.most_recent[0] if level == 'facile'
    q = Question.hard.most_recent[0] if level == 'difficile'
    render 'question/show', locals: q.attributes.symbolize_keys
  end

  def validate_attempt
    params.inspect
    render 'final/index'
    # redirect_to final_index_path(for_id: 'blabla')
  end
end

