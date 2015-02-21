require 'articulate_animal'
require 'digest'

class Player < ArticulateAnimal

  attr_accessor :worlds, :debug_output_level

  def initialize name
    super
    @name = name
    # The short hash is added so that when we remove chars we don't create the same system name for Joe and Joe!
    @system_name = name.gsub(/[^a-z0-9]+/i, '') + '_' + Digest::MD5.hexdigest(name)[0...8]
    @save_dir = File.join(SAVE_PATH, @system_name)

    @debug_output_level = 0

    @counts = {}

    debug_output 'player instantiated. about to load.'

    load
  end

  def save_file_name
    File.join(@save_dir, 'player.yml')
  end

  def worlds_save_file_name
    File.join(@save_dir, 'worlds.yml')
  end

  def default_file_name
    File.join(DATA_PATH, 'default_player.yml')
  end

  def default_worlds_file_name
    File.join(DATA_PATH, 'default_worlds.yml')
  end

  def save_file_exists
    File.exist? save_file_name
  end

  def worlds_save_file_exists
    File.exist? worlds_save_file_name
  end

  def debug_output str=nil, level=nil
    level ||= 1
    str ||= 'abunai'
    str += ' | ' + `ps -o rss -p #{$$}`.strip.split.last.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,") + ' Kb'

    if @debug_output_level >= level
      puts ("\n[#{str}]\n").black
      return true
    end
    return false
  end

  def increment countable_thing
    raise TypeError unless countable_thing.is_a? String or countable_thing.is_a? Symbol
    countable_thing = countable_thing.to_sym
    if @counts.key? countable_thing
      @counts[countable_thing] += 1
    else
      @counts[countable_thing] = 1
    end

  end

  def name
    # todo have color reflect condition? move from white (well) to yellow to orange to red (near death)
    @name.magenta
  end

  private

  def load

    if self.save_file_exists
      puts 'Loading a save file that I found...'

      debug_output 'loading ' + save_file_name.red
      data = YAML.load_file(save_file_name)
      @location = Location::get_by_id data[:location_id]
    else
      puts 'I found no save file for you, ' + name + ', so let’s start you off right...'
      debug_output 'loading ' + default_file_name.red
      data = YAML.load_file(default_file_name)
      # starting location is special.
      @location = Location::get_starting_location
    end

    self.set_descriptions data[:descriptions]
    @debug_output_level ||= data[:debug_output_level]
    @counts = data[:counts]

  end

end