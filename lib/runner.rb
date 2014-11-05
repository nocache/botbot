module Bot
  class Runner

    # in charge of dispatching commands to the bot
    def self.run(commands, state, options={})
      # ensure commands is an array, so that run can be called with a single command as well
      Array(commands).each do |command|
        puts command if options[:debug]

        case command.to_s
        when ''
          # do nothing

        when 'LEFT'
          state.left

        when 'RIGHT'
          state.right

        when 'MOVE'
          state.move

        when /^PLACE\s(.+)$/
          state.place($1)

        when 'REPORT'
          puts state.report

        end
      end
      state
    end
  end
end
