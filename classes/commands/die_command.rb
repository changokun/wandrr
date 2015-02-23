require 'reflexive_command'

class DieCommand < ReflexiveCommand

  def execute
    puts "\nYou die.\n".red
    $player.game.stop
  end

end

# aliases?
class ExitCommand < DieCommand 
end

class QuitCommand < DieCommand 
end

class QCommand < DieCommand 
end

