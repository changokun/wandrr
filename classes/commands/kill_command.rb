class KillCommand < Command
  def execute
    @game.player.debug_output self.class.to_s
    puts 'With what, your bare hands?'
  end
end

FightCommand = Class.new(KillCommand)
