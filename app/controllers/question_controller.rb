class QuestionController < ApplicationController

  def facile    
    populate_screen("facile")
  end

  def difficile   
    populate_screen("difficle")
  end

  def populate_screen(level)
    p '- - - - - - - - - - - - - - populate_screen- - - - - - - - - - - - - - - -' 
    p params[:for_id]
    p ''
    q = Question.first
    render 'question/show', locals: q.attributes.symbolize_keys
  end
end

