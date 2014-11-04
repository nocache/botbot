require 'minitest/autorun'
require_relative 'test_helper.rb'
require_relative '../bot'

describe Bot do
  before do
  end

  describe 'movement' do
    it 'discard all commands in the sequence until a valid PLACE command has been executed'
    it 'MOVE will move the toy robot one unit forward in the direction it is currently facing' do
      commands = [ 'PLACE 0,0,NORTH', 'MOVE', 'REPORT' ]
      Bot::Main.start(commands).must_equal '0,1,NORTH'
    end

    it 'LEFT will rotate the robot 90 degrees left without changing the position of the robot' do
      commands = [ 'PLACE 0,0,NORTH', 'LEFT', 'REPORT' ]
      Bot::Main.start(commands).must_equal '0,0,WEST'
    end

    it 'RIGHT will rotate the robot 90 degrees right without changing the position of the robot' do
      commands = [ 'PLACE 0,0,NORTH', 'RIGHT', 'REPORT' ]
      Bot::Main.start(commands).must_equal '0,0,EAST'
    end

    it 'REPORT will announce the X,Y and F of the robot' do
      commands = [ 'PLACE 2,3,WEST', 'REPORT' ]
      Bot::Main.start(commands).must_equal '2,3,WEST'
    end

    it 'A robot that is not on the table can choose the ignore the MOVE command'
    it 'A robot that is not on the table can choose the ignore the LEFT command'
    it 'A robot that is not on the table can choose the ignore the RIGHT command'
    it 'A robot that is not on the table can choose the ignore the REPORT command'

    it 'robot must not fall off the table during initial placement of the toy robot' do
      state = Bot::Status.new(Bot::Tabletop.new(5,5))
      state.place('10,2,EAST').x.must_be_nil
    end

    it 'Any move that would cause the robot to fall must be ignored'
    it 'further valid movement commands after suidcidal command must still be allowed'
  end
end
