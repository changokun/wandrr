require 'command'

class ReflexiveCommand < Command

  def execute actor, game
    if @verb == 'die'
      puts 'Game over man.'
      game.stop
    else
      puts '     ... but I do not know how to ' + @verb + '. Sorry.'
    end
  end
	
end
