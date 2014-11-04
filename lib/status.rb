module Bot
  class Status
    attr_accessor :x_pos, :y_pos, :direction

    def initialize(world=nil)
      world ||= World.new
      self
    end

    def inspect
      if @x_pos.nil? && @y_pos.nil? && @direction.nil?
        ''
      else
        "#{@x_pos},#{@y_pos},#{@direction}"
      end
    end

    # move 1 unit in direction facing
    # 0,0 is south-west corner
    def move
      case @direction
        when 'SOUTH'
          @y_pos -= 1
        when 'NORTH'
          @y_pos += 1
        when 'WEST'
          @x_pos -= 1
        when 'EAST'
          @x_pos += 1
        else
          # do nothing
      end
      self
    end

    def place(where)
      @x_pos, @y_pos, @direction = where.split(',')
      self
    end
  end
end

