require 'minitest/autorun'
require_relative '../bot.rb'

class CliTest < MiniTest::Unit::TestCase
  def setup
  end

  def test_that_empty_input_produces_empty_output
    assert_empty Bot::Main.call.to_s
  end

  #def test_that_it_gets_args
  #  assert_equal
  #end
end
