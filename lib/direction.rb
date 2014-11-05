module Bot
  module Direction

    DIRECTIONS = %w{ NORTH EAST SOUTH WEST } # Never Eat Soggy Weetbix. Cardinal points CW from 12 o'clock
    CLOCKWISE = 1
    ANTI_CLOCKWISE = -1

    # bot command: LEFT
    def left
      _rotate(ANTI_CLOCKWISE)
    end

    # bot command: RIGHT
    def right
      _rotate(CLOCKWISE)
    end

    def direction=(new_dir)
      @direction = new_dir if DIRECTIONS.include?(new_dir)
      @direction
    end

    private

    def current_direction_index
      DIRECTIONS.index(@direction)
    end

    def _rotate(dir)
      @direction = DIRECTIONS[ (current_direction_index + dir) % DIRECTIONS.size ] if @direction
      self
    end
  end
end
