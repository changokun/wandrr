class BelchCommand < Command
  def execute
    case @actor.count_of(self.class.to_s) % 3
    when 0
      puts 'You force out a meager sound no louder than tapping your fingers.'
    when 1
      puts 'Now there is a real belch. A belch any man would be proud to emit.'
    when 2
      puts 'A little of your own stomach bile rises from your throat and coats your tongue. It tastes like a spoonful of sour regret.'
    end
    @actor.increment self.class.to_s
    $player.debug_output "#{@actor.name} has belched #{@actor.count_of(self.class.to_s)} times."
  end
end

BurpCommand = BelchCommand

