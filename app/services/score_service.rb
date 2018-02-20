class ScoreService
  
  def initialize(attempt, question)
    @attempt = attempt
    @question = question
  end

  def update_status!
    @attempt.status = @attempt.updated_at ? "done" : "wip"
  end

  def update_score!
    score = 0
    start_time = @attempt.created_at
    end_time = @attempt.updated_at
    time_spent = end_time.to_f - start_time.to_f
    if (time_spent <= @question.point_plateau)
      score = @question.point_max
    else
      fat_time = time_spent - @question.point_plateau
      loss = fat_time * @question.point_loss
      score = @question.point_max - loss
    end

    score = score.floor

    score = 0 if (score < 0)
    score = 2 if (@attempt.nb_of_red_test == 0 && score == 0)

    @attempt.score = score
  end
end
