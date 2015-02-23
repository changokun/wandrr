require 'non_reflexive_command'

class KillCommand < NonReflexiveCommand

  def execute
    $player.debug_output self.class.to_s
    puts 'With what, your bare hands?'
  end
  
end

FightCommand = Class.new(KillCommand)
