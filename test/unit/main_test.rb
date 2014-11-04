require 'minitest/autorun'
require_relative '../test_helper.rb'
require_relative '../../bot'

class MainTest < MiniTest::Unit::TestCase
  def setup
  end

  def test_that_empty_input_produces_empty_output
    assert_empty Bot::Main.start
  end
end
