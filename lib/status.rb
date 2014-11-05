module Bot
  class Status
    attr_accessor :x, :y, :direction
    include Direction

    def initialize(world=nil)
      @world = world || World.new
      self
    end

    ## bot command method defs start here:
    # they are all chainable (return self)
    # left & right are defined in Direction module

    # move 1 unit in direction facing
    # 0,0 is south-west corner
    def move
      case @direction
        when 'SOUTH'
          self.y -= 1
        when 'NORTH'
          self.y += 1
        when 'WEST'
          self.x -= 1
        when 'EAST'
          self.x += 1
        else
          # do nothing
      end
      self
    end

    def place(where)
      coords = where.split(',')
      self.x = coords[0].to_i
      self.y = coords[1].to_i
      self.direction = coords[2]
      unless @x && @y && @direction
        # should ignore an invalid 'place' command altogther
        @x, @y, @direction = nil
      end
      self
    end

    def report
      puts inspect
      self
    end

    # end of bot command methods.

    # utility methods:

    def x=(new_x)
      @x = new_x if @world.valid_x?(new_x)
      @x
    end

    def y=(new_y)
      @y = new_y if @world.valid_y?(new_y)
      @y
    end

    def to_s
      if @x.nil? && @y.nil? && @direction.nil?
        ''
      else
        "#{@x},#{@y},#{@direction}"
      end
    end
    alias_method :inspect, :to_s

  end
end
