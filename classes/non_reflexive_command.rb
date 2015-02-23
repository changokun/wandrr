require 'command'

class NonReflexiveCommand < Command

  def initialize words, actor = nil
    super

    @direct_object = nil

    # is one of the words an object that can be looked at?
    verb = words.shift
    $player.debug_output 'What would Player like to ' + verb.red + '?'
    words.each do | word |
      $player.debug_output 'Is there a(n) ' + word + ' to ' + verb.red + '?'
    end

    puts 'We need to figure out how to get a direct object for your command, but we will roll without one for now'.green

  end

end