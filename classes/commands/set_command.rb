#this will need to be renamed at some point because we want players to be able to set things on top of other things

# right now 'set' will toggle debug output while in game. how about that?
# soon want to use 'set debug off'
# or set colors off etc.

class SetCommand < SystemCommand

	def execute
    if $player.debug_output_level > 0
      $player.debug_output 'Turning off debug output.'
      $player.debug_output_level = 0
    else
      $player.debug_output_level = 1
      $player.debug_output 'Turning on debug output.'
    end
	end

end