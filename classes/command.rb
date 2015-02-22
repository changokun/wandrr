class Command

  def initialize game, words
    @game = game
    @words = words
    @actor = nil
  end

  def execute
    raise 'unwritten execution for this command'
  end

end