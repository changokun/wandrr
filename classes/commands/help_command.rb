require 'system_command'

class HelpCommand < SystemCommand

  def execute
    puts "\n------------------------------\n".green
    puts 'HELP MENU'
    puts 'Maybe we will loop through the base command classes, and group the system, game, and secret commands here.'
    puts 'but for now you can:'
    puts "\n------ Player Commands".green
    puts 'look - for now will describe your surroundings.'
    puts 'wait - pass some time. Let others act.'
    puts 'die - end the game.'
    puts "\n------ System Commands".green
    puts 'set - will toggle debug output.'
    puts "\n------ Secret Commands".green
    puts 'burp'
    puts "\n------------------------------\n".green
  end

end

