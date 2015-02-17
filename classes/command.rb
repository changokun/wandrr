class Command

  def initialize
    @actor = ''
    @verb = ''
  end

  def execute actor, game
    if @verb == 'look'
      p 
      puts 'Game over man.'
      game.stop
    else
      puts '     ... but I do not know how to ' + @verb + '. Sorry.'
    end
  end

end