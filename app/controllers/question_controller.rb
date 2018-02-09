class QuestionController < ApplicationController

  def facile    
    q = Question.first
    render 'question/show', locals: q.attributes.symbolize_keys
  end

  def difficile   
    q = Question.first
    render 'question/show', locals: q.attributes.symbolize_keys
  end
end

