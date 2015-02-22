require 'describable'

class Being

  # capable of sensing and acting/reacting
  attr_reader :location_id

  include Describable

  def initialize(name=nil, location_id=nil)
    @name ||= name
    @location_id ||= location_id
  end

  def change_location location

    p location

    abort 'now make that loc change happen'
    # pass an id or a Location? either way, get the location.
    # check if you can get from current location to location
    # make any checks, event hooks, etc.
    # not sure how we track this..... is it a ref already? how do I keep it that way?
    



    # trigger events in old location
    # trigger events in new location (visit count)
  end

  def location
    Location::get_by_id @location_id
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