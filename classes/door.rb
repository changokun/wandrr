require 'describable'
require 'shines'

class Door

  include Describable, Shines

  attr_writer :portal, :other_side_location_id, :this_side_location_id, :other_side_location, :this_side_location

  def initialize
    @this_side_location_id
    @other_side_location_id
    @this_side_location
    @other_side_location
    @this_side_state = :shut # :open :ajar :cracked
    # @other_side_state ha ha who cares?
    @light_transmission_factor = {
      :open => 0.6,
      :ajar => 0.3,
      :cracked => 0.1,
      :closed => 0.05,
      :what => 'what do you mean this is too detailed? i did not even add teh sound transmission factors, yet!'
    }
    @portal = nil
  end

  def open actor = nil, words = nil
    # actor and words not needed yet, but they may finesse things in the future.
    if @this_side_state == :open
      puts 'The ' + simple_label + ' is already open.'
    else
      @this_side_state = :open
      puts 'You opened a ' + simple_label + '.'
      #queue up description?
      
    end
    puts 'You must be very pround of yourself.'
    
  end

  def describe depth, actor = nil
    super

    puts 'This ' + simple_label + ' is ' + @this_side_state.to_s + '.'
  end

  def destination
    @other_side_location
  end



end