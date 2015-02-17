require 'command'

class NonReflexiveCommand < Command

  def initialize words_from_input, actor
    @actor = actor
    @direct_object = actor.container # default 'look around'
    # is one of the words an object that can be looked at?
    words_from_input.each do | word |
      puts 'Is there a(n) ' + word + ' to look at?'
    end

    puts 'I am assuming you want to look around at your surroundings.'

  end

  def execute
    puts @direct_object.description @actor
  end

end