class Portal

  # you know, doors.

  # portals only allow connections between two places. if you want a door that leads to three places, you want an intermediary place with four portals.

  # a portal is a double-thing. It can look and behave differently depending on what side of it you are on. it may be locked from your side but easily opened from the other. it may be secret on your side and obvious on the other.

  # portals may transmit light and sound and gases to other locations, or they may muffle those things, or seal them in.

  # a portal may be closed but allow items to pass through, like that of a jail cell. there fore, it really means that a portal is a thing that a player must negotiate before proceeding, but other things don't nec need to.

  # how to handle the double-ness? in the record keeping, we store portals. when you want to interact with one, pass the portal your location, and you will receive a subclass that suits your needs. it might even be a Door obj or a TrapDoor object or perhaps a Ladder

  # also, if you are on an open street and you walk down the middle of it, is this a portal you pass through? I think so. that allows us to 'look down the street' and have the portal describe what you see. .... or what if exterior locations simply allowed free and open passage with no portals?

  # what about the edge of a cliff?

  # we could implement false doors that lead to no location as well. ... or that can never be opened.

  # if the same door object will work for both sides of the portal, let's allow for that.

  # also note that a portal may take up a lot of space and take time to get through. a door may lead to a crawl space that dumps you out somewhere else, which means that it can be open on one side, while being closed on the other.

  # ..... but most of the time opening a door from either side will open it for the other side as well. perhaps this is too complex.

  attr_reader :id

  def initialize location_a, door_a, location_b = nil, door_b = nil
    raise TypeError unless location_a.is_a? Location and door_a.is_a? Door
    # loc b is currently optional, for false doors. hmmm

    @location_a_id = location_a.id
    @location_b_id = location_b.id

    @door_a = door_a
    @door_b = door_b

    @id = Digest::MD5.hexdigest(@location_a_id.to_s + @location_b_id.to_s)

  end

  def get_portal_from_this_location location
    raise TypeError unless location.is_a? Location
    # is this location the a or the b?

    location.id == @location_a_id ? @door_a : @door_b
  end



end