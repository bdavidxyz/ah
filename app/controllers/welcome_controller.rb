class WelcomeController < ApplicationController
  def index    
    render locals: {
      path_of_easy_question:  question_path(Question.easy.most_recent[0].biz_id),
      path_of_hard_question:  question_path(Question.hard.most_recent[0].biz_id)
    }
  end
end
