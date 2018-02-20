class FinalController < ApplicationController

  def create
    attempt = Attempt.find_by!(biz_id: attempt_params[:biz_id])
    question = attempt.question
    attempt.update(attempt_params)
    service = ScoreService.new(attempt, question)
    service.update_status!
    service.update_score!
    attempt.update(attempt_params)
  end

  private

  def attempt_params
    params.permit(
      :biz_id, 
      :functionf, 
      :nb_of_lint_warning, 
      :nb_of_lint_error,
      :nb_of_green_test,
      :nb_of_red_test
    ).to_h.symbolize_keys
  end
end
