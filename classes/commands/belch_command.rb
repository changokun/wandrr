class BelchCommand < Command
  def execute
    @game.player.debug_output self.class.to_s
    #@game.player.increment 'belches'
    puts 'You emit a loud burp.'
  end
end

class BurpCommand < BelchCommand
end
