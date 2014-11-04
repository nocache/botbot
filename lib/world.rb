module Bot
  class World
    attr_reader :height, :width

    def initialize(width=1, height=1)
      @height = height
      @width  = width
    end

    def valid_x?(x)
      (0..@width-1).cover? x
    end

    def valid_y?(y)
      (0..@height-1).cover? y
    end
  end
end
