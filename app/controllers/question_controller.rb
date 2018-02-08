class QuestionController < ApplicationController

  def facile    
    q = Question.first
    render locals: q.attributes.symbolize_keys
  end

  def difficile   
  end
end

