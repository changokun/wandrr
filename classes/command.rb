class Command

  def initialize words, actor = nil
    @words = words
    @actor = actor
    @actor ||= $player
    @verb = self.class.to_s.downcase.gsub 'command', ''
  end

  def execute
    raise 'unwritten execution for this command'
  end

  def post_execution
    @actor.changed
    @actor.notify_observers(@actor, self)
  end

end