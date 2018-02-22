class QuestionView < ViewObject

  attr_reader :functionf, :done, :question, :initial, :description, :tests

  def after_init(args)
    locals = hash_for(args)
    @functionf  = string_for(locals[:functionf])
    @done  = boolean_for(locals[:done])
    @question  = hash_for(locals[:question])
    @tests  = json_for(locals[:tests])
    @initial  = string_for(question[:initial])
    @description  = string_for(question[:description]).html_safe
  end

  def validation_href
    final_index_path(for_id: @context.params[:for_id])
  end

end
