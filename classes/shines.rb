module Shines
	
  def set_shine_level shine_level
    @shine_level ||= 0
    @shine_level = shine_level
    # we could add naration here based on increases or decreases
    # 'The candle burns out.'
    # 'the sun rises.'
    # 'You hear a buzzing as the neon sign blinks to life.'
  end

	def get_shine_level
		@shine_level ||= 0
    @shine_level
	end

end



