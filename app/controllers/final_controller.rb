class FinalController < ApplicationController

  def create
    attempt = Attempt.find_by!(biz_id: attempt_biz_id)
    attempt_form = fill_attempt_form(attempt)
    if attempt_form.valid?
      update_attempt(attempt_form, attempt)
      question = attempt.question
      service = ScoreService.new(attempt, question)
      service.update_status!
      service.update_score!
      redirect_to final_index_path(for_id: attempt_biz_id)
    else
      flash[:error] = attempt_form.errors.messages.values.flatten
      redirect_to question_path(attempt.question.biz_id, for_id: attempt_biz_id)
    end

  end

  def index
    attempt = Attempt.find_by!(biz_id: params[:for_id])
    render locals: {score: attempt.score}
  end

  private

  def attempt_biz_id
    params[:biz_id]
  end

  def update_attempt(attempt_form, attempt)
    attempt.update!(
      biz_id: attempt_form.biz_id, 
      functionf: attempt_form.functionf, 
      nb_of_lint_warning: attempt_form.nb_of_lint_warning, 
      nb_of_lint_error: attempt_form.nb_of_lint_error,
      nb_of_green_test: attempt_form.nb_of_green_test,
      nb_of_red_test: attempt_form.nb_of_red_test,
      nb_of_second_spent: attempt_form.nb_of_second_spent
      )

  end

  def fill_attempt_form(attempt)
    attempt_form = AttemptForm.new(attempt_params)
    attempt_form.nb_of_second_spent = Time.now.to_i - attempt.created_at.to_i
    p '- - - - - - - - - - - - - - attempt_form- - - - - - - - - - - - - - - -' 
    # p attempt_form.inspect
    # p attempt_form.functionf == attempt.question.initial
    p attempt_form.valid?
    p attempt_form.errors.messages.inspect
    p '*************'
    attempt_form
  end

  # def update_attempt(attempt)
  #   updating_hash = attempt_params
  #   updating_hash[:nb_of_second_spent] = Time.now.to_i - attempt.created_at.to_i
  # end

  def attempt_params
    params.permit(
      :biz_id, 
      :honeypot, 
      :functionf, 
      :nb_of_lint_warning, 
      :nb_of_lint_error,
      :nb_of_green_test,
      :nb_of_red_test
    ).to_h.symbolize_keys
  end
end
