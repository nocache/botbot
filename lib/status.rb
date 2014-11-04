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

    def move
      self
    end

    def place(where)
      @x_pos, @y_pos, @direction = where.split(',')
      self
    end
  end
end

