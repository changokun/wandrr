class BelchCommand < Command
  def execute
    #$player.increment 'belches'
    puts 'You emit a loud burp.'
  end
end

class BurpCommand < BelchCommand
end
