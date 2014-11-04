module Bot
  class Status
    attr_accessor :x_pos, :y_pos, :direction

    SOUTH = 'South'
    NORTH = 'North'
    EAST  = 'East'
    WEST  = 'West'

    def initialize(world=nil)
      world ||= World.new
      @x_pos = 0
      @y_pos = 0
      @direction = SOUTH
    end

    def inspect
      if @x_pos.nil? && @y_pos.nil? && @direction.nil?
        ''
      else
        "#{@x_pos},#{@y_pos},#{@direction.upcase}"
      end
    end
  end
end

