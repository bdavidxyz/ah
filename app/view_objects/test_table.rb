class TestTable < ViewObject

  def after_init(args)
    locals = hash_for(args)
    json_tests = JSON.parse(locals[:tests]) rescue {}
    all_tests = json_tests["tests"]
    @tests = array_of_hash_for(all_tests)
  end

  def tests
    @tests
  end

end
