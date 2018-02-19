class QuestionController < ApplicationController

  def show
    q = Question.find_by(biz_id: params[:id])
    render locals: q.attributes.symbolize_keys
  end

end

