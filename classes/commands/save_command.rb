class SaveCommand < SystemCommand
	
	def execute
    PlayerFactory::save_player
	end
  
end