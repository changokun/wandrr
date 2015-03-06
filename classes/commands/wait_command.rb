class WaitCommand < Command
  def execute
    $player.debug_output 'You skip your turn.'

    post_execution
  end
end

PassCommand = WaitCommand

