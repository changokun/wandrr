class DescribeLocationFromInside < Describe

  def self.call location, depth, actor

    if location.respond_to? :describe
      location.describe depth, actor
    else
      case actor.location.illumination_level
      when 0..9
        puts 'It is too dark to see where you are.' #except inside/outside?
      else
        puts 'This is a(n) ' + location.class.to_s + '. Someone needs to add some narrative.'
      end
    end

    # now describe things in the room.
    # are there doors?
    location.doors.each do | door | 
      Describe::call door, depth, actor
    end

  end

end