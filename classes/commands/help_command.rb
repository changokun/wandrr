require 'system_command'

class HelpCommand < SystemCommand

  def execute
    puts "\n------------------------------\n".green
    puts 'HELP MENU'
    puts 'Maybe we will loop through the base command classes, and group the system, game, and secret commands here.'
    puts 'but for now you can:'
    puts 'look'
    puts 'burp'
    puts 'wait'
    puts 'die'
    puts "\n------------------------------\n".green
  end

end

