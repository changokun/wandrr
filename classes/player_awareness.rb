module PlayerAwareness
	
  def is_known?
    @is_known ||= false
    @is_known
  end

  def is_known!
    @is_known ||= false
    $player.debug_output self.simple_label + ' is now known to the player.' if not @is_known
    @is_known = true
  end

  def is_not_known!
    @is_known = false
  end

  def is_forgotten!
    @is_known = false
  end

end