class CommandFactory

  def parse_input_string str
    puts 'Trying to figure out what you want when you say ,"' + str + '."'

    command = Command.new

    words = str.split(' ').map { | word | word.strip! }

    p words

    first_word = words.unshift
    if first_word == 'look'
      command = LookCommand.new words
    end

  end

end