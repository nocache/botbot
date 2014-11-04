# main toybot file
module Bot
  #
  # Bot::Main implements the basic input/output
  class Main

    # Main.call  starts the bot!
    # first arg is the command string.
    # options (optional) are last
    def self.call(commands=[], options={})
      world = Tabletop.new(5,5)
      state = Status.new(world)
      state = Runner.run(commands, state, options)
      state
    end
  end
end
