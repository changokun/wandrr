require 'describable'

class Being

  # capable of sensing and acting/reacting

  include Describable

  def initialize(name=nil, location_id=nil)
    @name |= name
    @location_id |= location_id
    # lazy load
    @location = nil
  end

  def change_location location

    p location

    abort 'now make that loc change happen'
    # pass an id or a Location? either way, get the location.
    # check if you can get from current location to location
    # make any checks, event hooks, etc.
    # not sure how we track this..... is it a ref already? how do I keep it that way?
    @location = location
    # trigger events in old location
    # trigger events in new location (visit count)
  end

  def location
    return @location unless @location.nil?
    @location = Location::get_by_id @location_id
    puts 'here'
    p @location
    abort
  end

  def container
    self.location
  end
  
end