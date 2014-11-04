require_relative 'errors'

module Bot
  class Runner
    def self.run(commands, world, state)
      # main event loop:
      commands.each do |command|
        puts command
        case command
        when ''
          # do nothing

        when 'REPORT'
          puts state.inspect

        when /^PLACE\s(.+)$/
          state.place($1)

        else
          raise Bot::UnknownCommandError
        end
      end
      state
    end
  end
end
