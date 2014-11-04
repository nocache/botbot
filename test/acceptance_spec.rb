require 'minitest/autorun'
require_relative 'test_helper.rb'
require_relative '../bot'

describe Bot do
  before do
  end

  describe 'movement' do
    it 'discard all commands in the sequence until a valid PLACE command has been executed' do
      commands = [ '', 'MOVE', 'NOOP', 'PLACE 10000,0,NORTH', 'PLACE 0,0,NORTH', 'REPORT' ]
      Bot::Main.start(commands).must_equal '0,0,NORTH'
    end

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

    describe 'A robot that is not on the table' do
      it 'can choose to ignore the MOVE command'
      it 'can choose to ignore the LEFT command'
      it 'can choose to ignore the RIGHT command'
      it 'can choose to ignore the REPORT command'
    end

    it 'robot must not fall off the table during initial placement of the toy robot' do
      Bot::Main.start('PLACE 10,2,EAST').must_be_empty
      Bot::Main.start('PLACE 1,-2,EAST').must_be_empty
    end

    it 'Any move that would cause the robot to fall must be ignored' do
      commands = [ 'PLACE 0,0,SOUTH', 'MOVE', 'REPORT' ]
      Bot::Main.start(commands).must_equal '0,0,SOUTH'
    end

    it 'further valid movement commands after suidcidal command must still be allowed' do
      commands = [ 'PLACE 4,4,EAST', 'MOVE', 'RIGHT', 'MOVE', 'REPORT' ]
      Bot::Main.start(commands).must_equal '4,3,SOUTH'
    end
  end
end
