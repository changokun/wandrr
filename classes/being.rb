class Being

  attr_reader :current_location_id
  # capable of sensing and acting/reacting
  def initialize(name=nil, current_location_id=nil)
    @name |= name
    @current_location_id |= current_location_id
    # lazy load
    @current_location = nil
  end

  def change_location location
    # pass an id or a Location? either way, get the location.
    # check if you can get from current location to location
    # make any checks, event hooks, etc.
    # not sure how we track this..... is it a ref already? how do I keep it that way?
    @location_pointer = location
    # trigger events in old location
    # trigger events in new location (visit count)
  end

  def location
    return @current_location unless @current_location.nil?
    @current_location = Location::get_by_id @current_location_id
  end
  
end