require 'minitest/autorun'
require_relative '../../bot.rb'

class MainTest < MiniTest::Unit::TestCase
  def setup
  end

  def test_that_empty_input_produces_empty_output
    assert_empty Bot::Main.start
  end
end
