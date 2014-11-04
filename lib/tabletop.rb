module Bot
  class Tabletop < World
    def initialize(width=1, height=1)
      width = width.to_i
      height = height.to_i
      raise ArgumentError('width') if width < 1
      raise ArgumentError('height') if height < 1
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
