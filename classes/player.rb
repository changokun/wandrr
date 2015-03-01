require 'articulate_animal'
require 'digest'

class Player < ArticulateAnimal

  attr_accessor :debug_output_level, :file_safe_name, :game, :locations, :portals

  def initialize name = nil
    super
    @name = 'default' # because the only way to get a real one is by loading data files. see factory
    @debug_output_level = 1
    @file_safe_name = nil
    @game = nil # will hold a ref to the running game. should not be marshaled.

    @locations = {}
    @portals = {}
  end



  # move to global function
  def debug_output str='abunai', level=1
    str = str.to_s
    str << ' | ' + `ps -o rss -p #{$$}`.strip.split.last.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,") + ' Kb'

    if @debug_output_level >= level
      puts '['.black + str.black + ']'.black
      return true
    end
    return false
  end

  # moving to module
  def increment countable_thing
    raise TypeError unless countable_thing.is_a? String or countable_thing.is_a? Symbol
    countable_thing = countable_thing.to_sym
    if @counts.key? countable_thing
      @counts[countable_thing] += 1
    else
      @counts[countable_thing] = 1
    end

  end

  def name
    # todo have color reflect condition? move from white (well) to yellow to orange to red (near death)
    @name.magenta
  end

  def set_name name
    raise 'cannot change names.' unless @name == 'default'
    @name = name
  end













end
