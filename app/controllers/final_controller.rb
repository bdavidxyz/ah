class FinalController < ApplicationController

  def create
    # params.inspect
    attempt = Attempt.new(validate_attempt_params)
    p '- - - - - - - - - - - - - - create- - - - - - - - - - - - - - - -' 
    p attempt.inspect
    p ''
    # render 'final/index'
    # redirect_to final_index_path(for_id: 'blabla')
  end

  private

  def validate_attempt_params
    params.permit(
      :biz_id, 
      :functionf, 
      :nb_of_lint_warning, 
      :nb_of_lint_error,
      :nb_of_green_test,
      :nb_of_red_test
      ).to_h
  end
end
