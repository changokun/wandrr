class DescribeLocationFromInside < Describe

  def self.call location, depth, actor

    # now describe everything in order of descending shine.
    # first collect everything we will describe:
    describable_things = []
    describable_things << location
    location.doors.each { | door | describable_things << door } 
    # describable_things << location.contents.each

    # sort describable_things
    # 

    describable_things.sort! do |a, b|
      case
      when a.respond_to?(:get_shine_level) == false || b.respond_to?(:get_shine_level) == false
        nil
      when a.get_shine_level < b.get_shine_level
        1
      when a.get_shine_level > b.get_shine_level
        -1
      else
        nil
      end
    end 


    # abort describable_things.to_yaml
    

    # soon we will do this for sounders (that have not already been described), too

    describable_things.each do | describable_thing |
      if describable_thing.respond_to? :describe
        describable_thing.describe depth, actor
      else
        case actor.location.get_illumination_level
        when 0..9
          puts 'It is too dark to see where you are.' #except inside/outside?
        else
          puts 'This is a(n) ' + describable_thing.class.to_s + '. Someone needs to add some narrative.'
        end
      end
    end

#    end

  end

end