require 'container'

# maybe a location is defined by the lighting. a well lit room prevents seeing under tables without kneeling and looking, which is a lot like entering.
class Location < Container
  attr_accessor :sysname, :map_name, :short_name, :long_name, :descriptions
  def initialize short_name=nil
    @sys_name = 'nowhere'
    @map_name = 'Nowhere'
    @short_name = 'Nowhere'
    @long_name = 'Nowhere at all'
    @descriptions = {:daylight => 'This is no place anywhere.'}
    @illumination_level = :daylight

    #sublocations
    @locations = [] 

    if short_name
      @short_name = short_name
      @sys_name = @short_name.gsub(/[^a-z0-9]/, '_').downcase!
      @map_name = @short_name
    end
  end

  def add_location loc
    raise TypeError, 'must be Location' unless loc.is_a? Location
    @locations << loc
  end

end
