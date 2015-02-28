require 'system_command'

class HelpCommand < SystemCommand

  def execute
    puts "\n------------------------------\n".green
    puts 'HELP MENU'
    puts 'Maybe we will loop through the base command classes, and group the system, game, and secret commands here.'
    puts 'but for now you can:'

    puts "\n------ Player Commands".green
    puts 'look [something] - will describe your surroundings unless you look at something.'
    puts 'wait, pass - pass some time. Let others act.'
    puts 'die, exit, quit, q - end the game.'
    puts 'push, pull, move - general interactions.'

    puts "\n------ System Commands".green
    puts 'save - does nothing.'
    puts 'load - does nothing.'
    puts 'set - will toggle debug output.'

    puts "\n------ Secret Commands".green
    puts 'burp'
    puts "\n------------------------------\n".green
  end

end

