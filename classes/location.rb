require 'capacitous'
require 'digest'
require 'describable'
require 'shines'


# maybe a location is defined by the lighting. a well lit room prevents seeing under tables without kneeling and looking, which is a lot like entering.
class Location

  include Describable, Capacitous, Shines

  attr_accessor :sysname, :map_name, :short_name, :long_name, :descriptions, :id
  attr_reader :doors

  def initialize short_name = nil
    @sys_name = 'nowhere'
    @map_name = 'Nowhere'
    @short_name = 'Nowhere'
    @long_name = 'Nowhere at all'
    default_descriptions = {
      0..99 => {:any => 'This is no place anywhere.'}
    }
    self.set_descriptions default_descriptions

    @id = Time.now.strftime('%Y-%m-%d') + '_' + Digest::MD5.hexdigest(short_name)[0...16]

    if short_name
      @short_name = short_name
      @sys_name = @short_name.gsub(/[^a-z0-9]/, '_').downcase!
      @map_name = @short_name
    end
    @doors = []
  end

  def get_illumination_level

    # loop through everything in the location and find the highest shine level
    illumination_level = self.get_shine_level

    doors.each do | door |
      illumination_level = door.get_shine_level if door.get_shine_level > illumination_level
    end

    # again for contents.
    contents.each do | contained_thing |
      if contained_thing.respond_to? :get_shine_level
        illumination_level = contained_thing.get_shine_level if contained_thing.get_shine_level > illumination_level
      end
    end

    $player.debug_output 'How bright is it in here (or wherever the actor is)? ' + illumination_level.to_s.red, 5

    illumination_level

  end

  def name
    @short_name.cyan
  end


end
