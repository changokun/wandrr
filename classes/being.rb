require 'describable'
require 'responds'
require 'player_awareness'
require 'keeps_count'
require "observer"

class Being

  # capable of sensing and acting/reacting
  attr_reader :id

  include Describable, Responds, PlayerAwareness, KeepsCount, Observable

  def initialize(name=nil, location_id=nil, description=nil)
    @name ||= name
    self.might_be_called @name
    @location_id ||= location_id
    self.add_description description unless description.nil?
  end

  def change_location destination

    @location = destination
    @location_id = destination.id

    $player.debug_output "#{name} moves to #{destination.name}"

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

  def name
    # todo have color reflect condition? move from white (well) to yellow to orange to red (near death)
    @name.magenta
  end

  def update actor, command
    puts "#{self.name} observes #{actor.name}’s #{command.class.to_s}"
  end
  
end
