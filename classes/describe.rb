class Describe

  # Describe.call this_thing, briefly, to_this_actor
  def self.call obj, depth, actor = $player
    
    if obj.class == Location
      if actor.location.id == obj.id
        DescribeLocationFromInside.call obj, depth, actor
      else
        puts 'let us DescribeLocationFromOutside'
        DescribeLocationFromOutside.call obj, depth, actor
      end
    # elsif obj.class == Condition
      #detect what this is the condition of then:
      #DescribeConditionInSecondPerson you feel sick.
      #DescribeConditionInThirdPerson he is bleeding.
    else
      DescribeItem.call obj, depth, actor
    end

    if obj.is_a? Capacitous
      obj.contents.each { | item | 
        DescribeItem.call item, depth, actor 
      }
    end

  end

end
