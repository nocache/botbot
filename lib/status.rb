module Bot
  class Status
    attr_accessor :x, :y, :direction

    DIRECTIONS = %w{ NORTH EAST SOUTH WEST } # Never Eat Soggy Weetbix. Cardinal points CW from 12 o'clock
    CLOCKWISE = 1
    ANTI_CLOCKWISE = -1

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
      _rotate(ANTI_CLOCKWISE)
    end

    def right
      _rotate(CLOCKWISE)
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
      unless @x && @y && @direction
        # should ignore an invalid 'place' command altogther
        @x, @y, @direction = nil
      end
      self
    end

    def direction=(new_dir)
      @direction = new_dir if DIRECTIONS.include?(new_dir)
      @direction
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

