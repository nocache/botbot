module Bot
  class Status
    attr_accessor :x, :y, :direction

    DIRECTIONS = %w{ NORTH EAST SOUTH WEST } # Never Eat Soggy Weetbix. Cardinal points in CW from 12 o'clock

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

    def current_direction_index
      DIRECTIONS.index(@direction)
    end

    def left
      # left is CCW
      @direction = DIRECTIONS[ (current_direction_index - 1) % DIRECTIONS.size ]
      self
    end

    def right
      # right is CW
      @direction = DIRECTIONS[ (current_direction_index + 1) % DIRECTIONS.size ]
      self
    end

    # move 1 unit in direction facing
    # 0,0 is south-west corner
    def move
      case @direction
        when 'SOUTH'
          @y -= 1
        when 'NORTH'
          @y += 1
        when 'WEST'
          @x -= 1
        when 'EAST'
          @x += 1
        else
          # do nothing
      end
      self
    end

    def place(where)
      coords = where.split(',')
      @x = coords[0].to_i
      @y = coords[1].to_i
      @direction = coords[2]
      self
    end

    def report
      inspect
    end
  end
end

