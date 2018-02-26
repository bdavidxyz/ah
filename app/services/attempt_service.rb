class AttemptService

  def initialize(attempt)
    @attempt = attempt
  end

  def update_from_form(attempt_form)
    @attempt.functionf          = attempt_form.functionf
    p '- - - - - - - - - - - - - - functionf- - - - - - - - - - - - - - - -' 
    p @attempt.functionf.inspect
    p ''
    @attempt.nb_of_lint_warning = attempt_form.nb_of_lint_warning 
    @attempt.nb_of_lint_error   = attempt_form.nb_of_lint_error
    @attempt.nb_of_green_test   = attempt_form.nb_of_green_test
    @attempt.nb_of_red_test     = attempt_form.nb_of_red_test
    @attempt.nb_of_second_spent = attempt_form.nb_of_second_spent
  end

  def update_score(score)
    @attempt.score         = score
  end

  def update_status
    @attempt.status = @attempt.updated_at ? "done" : "wip"
  end

end
