class ScoreService
  
  def initialize(attempt, question)
    @attempt = attempt
    @question = question
  end

  def score
    score = 0
    tenth = @question.point_max / 10
    start_time = @attempt.created_at
    end_time = @attempt.updated_at
    time_spent = @attempt.nb_of_second_spent

    if (time_spent <= @question.point_plateau)
      score = @question.point_max
    else
      fat_time = time_spent - @question.point_plateau
      loss = fat_time * @question.point_loss
      score = @question.point_max - loss
    end

    score = 0 if @attempt.nb_of_red_test > 1
    
    score = score - (1 * tenth * @attempt.nb_of_lint_warning)
    score = score - (3 * tenth * @attempt.nb_of_lint_error)
    score = score - (5 * tenth * @attempt.nb_of_red_test)

    score = score.floor
    score = 0 if (score < 0)
    score = 2 if (@attempt.nb_of_red_test == 0 && score == 0)

    "#{score}/#{@question.point_max}"
  end
end
