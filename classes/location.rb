require 'container'
require 'digest'
require 'describable'


# maybe a location is defined by the lighting. a well lit room prevents seeing under tables without kneeling and looking, which is a lot like entering.
class Location < Container

  include Describable

  attr_accessor :sysname, :map_name, :short_name, :long_name, :descriptions, :id, :illumination_level

  def initialize short_name=nil
    @sys_name = 'nowhere'
    @map_name = 'Nowhere'
    @short_name = 'Nowhere'
    @long_name = 'Nowhere at all'
    default_descriptions = {
      0..99 => {:any => 'This is no place anywhere.'}
    }
    self.set_descriptions default_descriptions
    @illumination_level = IlluminationLevel::DAYLIGHT

    @id = Time.now.strftime('%Y-%m-%d') + '_' + Digest::MD5.hexdigest(short_name)[0...16]

    # sublocations? 
    @locations = []

    if short_name
      @short_name = short_name
      @sys_name = @short_name.gsub(/[^a-z0-9]/, '_').downcase!
      @map_name = @short_name
    end
  end

  def portals
    portals = []
    $player.portals.each do | portal_id, portal |
      if portal.location_a_id == @id or portal.location_b_id == @id
        portals << portal
      end
    end
    portals
  end

  def doors
    doors = []
    self.portals.each do | portal |
      doors << portal.get_door_for_location(self)
    end
    doors
  end




end
