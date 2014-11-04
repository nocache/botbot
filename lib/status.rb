module Bot
  class Status
    attr_accessor :x, :y, :direction

    DIRECTIONS = %w{ NORTH EAST SOUTH WEST } # Never Eat Soggy Weetbix. Cardinal points in CW from 12 o'clock
    CW = 1
    CCW = -1

    def initialize(world=nil)
      @world = world || World.new
      self
    end

    def inspect
      if @x.nil? && @y.nil? && @direction.nil?
        ''
      else
        "#{@x},#{@y},#{@direction}"
      end
    end
    alias_method :report, :inspect

    def current_direction_index
      DIRECTIONS.index(@direction)
    end

    def left
      _rotate(CCW) # left is CCW
    end

    def right
      _rotate(CW)  # right is CW
    end

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
      self
    end

    def x=(new_x)
      @x = new_x if @world.valid_x?(new_x)
      @x
    end

    def y=(new_y)
      @y = new_y if @world.valid_y?(new_y)
      @y
    end

    private
    def _rotate(dir)
      @direction = DIRECTIONS[ (current_direction_index + dir) % DIRECTIONS.size ]
      self
    end
  end
end

