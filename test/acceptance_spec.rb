require 'minitest/autorun'
require_relative 'test_helper.rb'
require_relative '../bot'

describe Bot do

  it 'discard all commands in the sequence until a valid PLACE command has been executed' do
    commands = [ '', 'MOVE', 'NOOP', 'PLACE 10000,0,NORTH', 'PLACE 0,0,NORTH' ]
    Bot::Main.call(commands).to_s.must_equal '0,0,NORTH'
  end

  it 'MOVE will move the toy robot one unit forward in the direction it is currently facing' do
    commands = [ 'PLACE 0,0,NORTH', 'MOVE' ]
    Bot::Main.call(commands).to_s.must_equal '0,1,NORTH'
  end

  it 'LEFT will rotate the robot 90 degrees left without changing the position of the robot' do
    commands = [ 'PLACE 0,0,NORTH', 'LEFT' ]
    Bot::Main.call(commands).to_s.must_equal '0,0,WEST'
  end

  it 'RIGHT will rotate the robot 90 degrees right without changing the position of the robot' do
    commands = [ 'PLACE 0,0,NORTH', 'RIGHT' ]
    Bot::Main.call(commands).to_s.must_equal '0,0,EAST'
  end

  it 'REPORT will announce the X,Y and F of the robot' do
    commands = [ 'PLACE 2,3,WEST' ]
    Bot::Main.call(commands).to_s.must_equal '2,3,WEST'
  end

  describe 'A robot that is not on the table' do
    subject do
      Bot::Main.call('NOOP')
    end

    it 'can choose to ignore the MOVE command' do
      subject.move.to_s.must_be_empty
    end

    it 'can choose to ignore the LEFT command' do
      subject.left.to_s.must_be_empty
    end

    it 'can choose to ignore the RIGHT command' do
      subject.right.to_s.must_be_empty
    end

    it 'can choose to ignore the REPORT command' do
      subject.report.to_s.must_be_empty
    end
  end

  it 'robot must not fall off the table during initial placement of the toy robot' do
    Bot::Main.call('PLACE 10,2,EAST').to_s.must_be_empty
    Bot::Main.call('PLACE 1,-2,EAST').to_s.must_be_empty
  end

  it 'Any move that would cause the robot to fall must be ignored' do
    commands = [ 'PLACE 0,0,SOUTH', 'MOVE' ]
    Bot::Main.call(commands).to_s.must_equal '0,0,SOUTH'
  end

  it 'further valid movement commands after suidcidal command must still be allowed' do
    commands = [ 'PLACE 4,4,EAST', 'MOVE', 'RIGHT', 'MOVE' ]
    Bot::Main.call(commands).to_s.must_equal '4,3,SOUTH'
  end

end
