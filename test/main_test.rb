require 'minitest/autorun'
require_relative 'test_helper.rb'
require_relative '../bot'

class MainTest < MiniTest::Unit::TestCase
  def setup
  end

  def test_that_empty_input_produces_empty_output
    assert_empty Bot::Main.call.to_s
  end

  def test_that_bot_reports_its_initial_position
    assert_equal '0,0,SOUTH', Bot::Main.call('PLACE 0,0,SOUTH').to_s
  end
end
