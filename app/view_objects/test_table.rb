class TestTable < ViewObject

  def after_init(args)
    locals = hash_for(args)
    question = hash_for(locals[:question])
    json_tests = JSON.parse(question[:tests])
    all_tests = json_tests["tests"]
    @tests = array_of_hash_for(all_tests)
  end

  def tests
    @tests
  end

end
