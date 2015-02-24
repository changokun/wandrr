class MoveCommand < Command
  # start the process of changing locations.
  # must have portal.

  def initialize words, actor = nil
    super

    # variations to be prepared for:
    # move - move self through implicit portal or ask for one.
    # move through door - move self through door to new location
    # move book to table - change the description of your location, hoping to trigger an event.

    p @words

    if words.length == 1
      # no portal nor direct object specified. let's assume they want to move themselves.
      @actor = $player
      # are there any portals?
      p @actor.location

    else
      puts 'not sure what to do with this: '
      p @words
    end

    

    
    # aliases: go, set, leave, flee, run away, run, walk, crawl
    puts 'actor: ' + @actor.name
  end

  def execute
    puts 'moving. really. far.'
  end

end

class LeaveCommand < MoveCommand
end

# todo i fyou say 'move' without argument, and there is only one portal, you go through it.
# but if you say move without argument and there are more, must get clarification.
# 'leave,' however, should take you back to where you were, so the portal you used is the implicit one. ofcourse, we should allow 'leave by back door'


# and of course, if the argument is an object, it means we want to change its location, eg 'move book to table.' Non/Reflexive should take care of that distinction.

# hmmm... 'run away' should probably count as one word.


