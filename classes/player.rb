require 'articulate_animal'
require 'digest'


class Player < ArticulateAnimal

  attr_accessor :debug_output_level, :file_safe_name, :game

  def initialize name = nil
    super
    @name = 'default' # because the only way to get a real one is by loading data files. see factory
    @debug_output_level = 0
    @file_safe_name = nil
    @game = nil # will hold a ref to the running game. should not be marshaled.
  end



  # move to global function
  def debug_output str='abunai', level=1
    str = str.to_s
    str << ' | ' + `ps -o rss -p #{$$}`.strip.split.last.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,") + ' Kb'

    if @debug_output_level >= level
      puts "[#{str}]".black
      return true
    end
    return false
  end


  def set_name name
    raise 'cannot change names.' unless @name == 'default'
    @name = name
  end













end
