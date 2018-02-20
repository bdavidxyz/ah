class QuestionController < ApplicationController

  def show
    q = Question.find_by(biz_id: params[:id])
    attempt_biz_id = params[:for_id]
    att = Attempt.find_or_create_by(biz_id: attempt_biz_id, question_id: q.id)
    h_view = {}
    h_view[:question] = q.attributes.symbolize_keys
    h_view[:functionf] = att.functionf
    p '- - - - - - - - - - - - - - h_view- - - - - - - - - - - - - - - -' 
    p h_view.inspect
    p ''
    render locals: h_view
  end

end

