require 'describable'

class Door

  include Describable

  def initialize
    @this_side_location_id
    @other_side_location_id
    @this_side_state = :shut # :open :ajar :cracked
    # @other_side_state ha ha who cares?
  end

  def open actor = nil, words = nil
    # actor and words not needed yet, but they may finesse things in the future.
    if @this_side_state == :open
      puts 'the door is already open!'
    else
      @this_side_state = :open
      puts 'YAY you opened a door!!!'
      #queue up description?
      
    end
  end

  def describe depth, actor = nil
    super

    puts 'This ' + simple_label + ' is ' + @this_side_state.to_s + '.'
  end



end