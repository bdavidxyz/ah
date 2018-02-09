class TestTableRow < ViewObject

  attr_reader :position, :test_function, :test_expectation

  def after_init(args)
    locals = hash_for(args)
    @position = string_for(args[:index])
    @test_function = string_for(args[:test_function])
    @test_expectation = string_for(args[:test_expectation])
  end

  def badge_css
  end

  def badge_text
  end

  def _is_ok
    return true
  end
end
