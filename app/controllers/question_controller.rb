class QuestionController < ApplicationController

  def show
    question = find_question_or_fail(params[:id])
    attempt = find_or_create_attempt(params[:for_id], question)
    render locals: hydrate_view(question, attempt)
  end

private
  def find_question_or_fail(id)
    Question.find_by!(biz_id: id)
  end

  def find_or_create_attempt(biz_id, question)
    Attempt.find_or_create_by(biz_id: biz_id, question_id: question.id)
  end

  def hydrate_view(question, attempt)
    h_view = {}
    h_view[:question] = question.attributes.symbolize_keys
    h_view[:functionf] = attempt.functionf
    h_view[:done] = attempt.status == "done"
    h_view
  end

end

