class TestTable < ViewObject

  def after_init(args)
    locals = hash_for(args)
    @tests = array_of_hash_for(locals[:tests])
  end

  def tests
    @tests
  end

end
