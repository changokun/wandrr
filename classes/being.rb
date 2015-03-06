require 'describable'
require 'responds'
require 'player_awareness'
require 'keeps_count'

class Being

  # capable of sensing and acting/reacting
  # kill attr_reader :location_id

  include Describable, Responds, PlayerAwareness, KeepsCount

  def initialize(name=nil, location_id=nil)
    @name ||= name
    @location_id ||= location_id
  end

  def change_location destination

    @location = destination
    @location_id = destination.id

    puts name + ' moves to ' + destination.name + '.'

    # check if you can get from current location to location
    # make any checks, event hooks, etc.
    # not sure how we track this..... is it a ref already? how do I keep it that way?
    



    # trigger events in old location
    # trigger events in new location (visit count)
  end

  def location
    #todo add error handling
    $locations[@location_id]
  end

  def set_location_id id
    # can only set id if it is not already set, other wise go through the normal moving channels.
    raise 'cannot set location id for something that already is somewhere. jeez.' unless @location_id.nil?
    @location_id = id
  end

  def container
    self.location
  end
  
end