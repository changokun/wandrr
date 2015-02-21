#this will need to be renamed at some point because we want players to be able to set things on top of other things

# right now 'set' will toggle debug output while in game. how about that?
# soon want to use 'set debug off'
# or set colors off etc.

class SetCommand < SystemCommand

	def execute
    if @game.player.debug_output_level > 0
      @game.player.debug_output 'Turning off debug output.'
      @game.player.debug_output_level = 0
    else
      @game.player.debug_output_level = 1
      @game.player.debug_output 'Turning on debug output.'
    end
	end

end