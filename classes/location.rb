
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

    if short_name
      @short_name = short_name
      @sys_name = @short_name.downcase!.gsub /[^a-z0-9]/, '_'
      @map_name = @short_name
    end
  end
end
