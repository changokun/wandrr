require 'container'
require 'yaml'
require 'digest'
require 'describable'


# maybe a location is defined by the lighting. a well lit room prevents seeing under tables without kneeling and looking, which is a lot like entering.
class Location < Container

  include Describable

  attr_accessor :sysname, :map_name, :short_name, :long_name, :descriptions, :id, :illumination_level

  # The "World," as it were.
  @@locations = nil

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

    #sublocations
    @locations = [] 

    if short_name
      @short_name = short_name
      @sys_name = @short_name.gsub(/[^a-z0-9]/, '_').downcase!
      @map_name = @short_name
    end
  end


  def self.get_by_id id
    self.load_the_world if @@locations.nil?
    @@locations[id]
  end


end
