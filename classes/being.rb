require 'describable'
require 'responds'
require 'player_awareness'
require 'keeps_count'
require "observer"

class Being

  # capable of sensing and acting/reacting
  attr_reader :id, :location

  include Describable, Responds, PlayerAwareness, KeepsCount, Observable

  def initialize(name=nil, location=nil, description=nil)
    @name ||= name
    self.might_be_called @name
    @location ||= location
    self.add_description description unless description.nil?
  end

  def change_location destination

    $player.debug_output "#{name} starts to move to #{destination.name}"


    # check if you can get from current location to location
    # make any checks, event hooks, etc.
    # not sure how we track this..... is it a ref already? how do I keep it that way?
    
    # trigger a DepartCommand? (for the observers who might care.)
    # detach observers from previous location
    location.contents.each do | item |
      $player.delete_observer(item) if item.is_a? Observable
    end


    # trigger events in old location
    $player.debug_output "#{name} moves to #{destination.name}"
    @location = destination


    # if the player has never been here before (count) trigger detailed look
    # if the player has been here, a brief look
    LookCommand.new(['look']).execute
    # some of this should happen before new observers can be attached.

    # attach observers, trigger an ArriveCommand?
    @location.contents.each do | item |
      $player.add_observer(item) if item.is_a? Observable
    end

    $player.debug_output "#{name} moved to #{destination.name}"

    # trigger events in new location (visit count)
  end

  def location= location
    # can only set id if it is not already set, other wise go through the normal moving channels.
    raise 'cannot set location id for something that already is somewhere. jeez.' unless @location.nil?
    @location = location
  end

  def container
    self.location
  end

  def name(decorated='decorated')
    return @name if decorated == 'undecorated'
    # todo have color reflect condition? move from white (well) to yellow to orange to red (near death)
    @name.magenta
  end

  def update actor, command
    if command.is_a? NonReflexiveCommand
      $player.debug_output "#{self.name} observes #{actor.name} #{command.verb} the #{command.direct_object.simple_label}"
      if actor == $player && command.verb == 'attack' and command.direct_object.could_be_called? 'door'
        puts "#{self.name} says, “You are an idiot.”"
      end
    else
      $player.debug_output "#{self.name} observes #{actor.name} #{command.verb}-ing"
    end
  end
  
end
