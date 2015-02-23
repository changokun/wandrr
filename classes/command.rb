class Command

  def initialize words, actor = nil
    @words = words
    @actor ||= $player
  end

  def execute
    raise 'unwritten execution for this command'
  end

end