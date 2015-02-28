require 'shines'

class Light < Item
  include Shines

  def is_lit! level = 50
    @shine_level_when_lit = level
    @shine_level = @shine_level_when_lit
  end

  def is_out!
    @shine_level = 0
  end

  def is_lit? to_at_least_level = 1
    @shine_level ||= 0
    @shine_level >= to_at_least_level
  end


  def toggle
    @shine_level ||= 0
    @shine_level_when_lit ||= 50 # use is_lit! to set, or ... make an accessor?
    if @shine_level > 0
      @shine_level = 0
      puts 'the light goes out.'
    else
      @shine_level = @shine_level_when_lit
      puts 'the light comes to life.'
    end
  end

end