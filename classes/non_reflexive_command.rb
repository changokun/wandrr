require 'command'

class NonReflexiveCommand < Command

  def initialize words, actor = nil
    super

    @direct_object = nil

    # is one of the words an object that can be looked at?
    words.each do | word |
      $player.debug_output 'Is there a(n) ' + word + ' to do something to/at/on?'
    end

  end

end