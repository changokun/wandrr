


class Command

  def initialize (str)
    @actor = ''
    @verb = str
    @direct_objects = []
  end

  def execute game
    if @verb == 'die'
      puts 'Game over man.'
      game.stop
    else
      puts '     ... but I do not know how to ' + @verb + '. Sorry.'
    end
  end

end