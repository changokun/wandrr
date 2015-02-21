class CommandFactory

  def self.parse_input_string str, game
    game.player.debug_output 'Trying to figure out what you want when you say, "' + str + '."', 2

    words = str.split(' ')
    words.map { | word | word.strip! }

    first_word = words.shift

    potential_command_class_name = first_word.capitalize + 'Command'

    return nil unless Object.const_defined?(potential_command_class_name)

    command_class = Object.const_get potential_command_class_name

    command_class.new game, words

  end

end