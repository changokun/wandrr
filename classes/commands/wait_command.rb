class WaitCommand < Command
  def execute
    $player.debug_output 'You skip your turn.'
  end
end

PassCommand = WaitCommand

