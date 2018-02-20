class QuestionController < ApplicationController

  def show
    q = Question.find_by(biz_id: params[:id])
    attempt_biz_id = params[:for_id]
    att = Attempt.find_or_create_by(biz_id: attempt_biz_id)
    p '- - - - - - - - - - - - - - att- - - - - - - - - - - - - - - -' 
    p att.inspect
    p ''
    render locals: q.attributes.symbolize_keys
  end

end

