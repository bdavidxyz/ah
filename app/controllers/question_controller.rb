class QuestionController < ApplicationController

  def facile    
    q = Question.first
    render locals: q.attributes
  end

  def difficile   
  end
end

