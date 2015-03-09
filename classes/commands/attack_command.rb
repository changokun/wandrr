require 'non_reflexive_command'

class AttackCommand < NonReflexiveCommand
  def initialize words, actor = $player
    super
    @verb = 'attack'
  end
end

FightCommand = AttackCommand
KillCommand = AttackCommand
