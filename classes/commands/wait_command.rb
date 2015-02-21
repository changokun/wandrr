class WaitCommand < Command
  def execute
    @game.player.debug_output 'You skip your turn.'
  end
end

class PassCommand < WaitCommand
end
