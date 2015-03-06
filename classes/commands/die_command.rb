require 'reflexive_command'

class DieCommand < ReflexiveCommand

  def execute
    puts "\nYou die.\n".red
    $player.game.stop
  end

end

# aliases?
ExitCommand = DieCommand 
QuitCommand = DieCommand 
QCommand = DieCommand 
