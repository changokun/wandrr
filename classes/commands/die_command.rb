require 'reflexive_command'

class DieCommand < ReflexiveCommand

  def execute
    puts 'Game over man.'
    @game.stop
  end

end

# aliases?
class ExitCommand < DieCommand 
end