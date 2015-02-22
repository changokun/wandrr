require 'articulate_animal'
require 'digest'

class Player < ArticulateAnimal

  attr_accessor :debug_output_level

  def initialize name
    super
    @debug_output_level = 0
  end



  def self.get_player_by_name name
    player = self.new name # gotta have player object to get save path.... for now.
    begin
      player.load
    rescue
      player = self.new 'default'
      player.load
      player.set_name name
    end
    player
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

  # moving to module
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

  def set_name name
    raise 'cannot change names.' unless @name == 'default'
    @name = name
  end








  def save data = nil
    # what is the data? self? some locations? etc
    if data.nil?
      file_name_base = self.class.to_s.downcase
      data = self
    elsif data.class == Hash
      file_name_base = data.values[0].class.to_s.downcase
    elsif data.class == Array
      file_name_base = data[0].class.to_s.downcase
    else
      raise 'I do not know yet how to save ' + data.class.to_s.red + '.'
    end

    File.open(File.join(data_path, file_name_base + '.yml'), 'w') do |file|
        file.puts YAML::dump(data)
        debug_output 'Fresh ' + file_name_base + ' data saved as YAML, so that we have a human-readable version (do not bother with editing it).'
    end

    File.open(File.join(data_path, file_name_base + '.data'), 'w') do |file|
        file.puts Marshal::dump(data)
        debug_output 'Fresh ' + file_name_base + ' data saved as binary data, so that we have an obfuscated version (which is what really gets loaded).'
    end
  end

  def data_path
    Dir::mkdir(DATA_PATH) unless Dir::exists? DATA_PATH
    path = File.join(DATA_PATH, get_file_safe_name)
    Dir::mkdir(path) unless Dir::exists? path
    path
  end

  def load
    file_name_base = self.class.to_s.downcase
    Marshal::load(File.open(File.join(data_path, file_name_base + '.data'), 'r'))
  end

  def load_world
    # basically, for every file in the data folder for htis player, load it to its class.
    Dir.new(data_path).each do | file_name |
      puts file_name
    end

    abort
    Marshal::load(File.open(File.join(data_path, file_name_base + '.data'), 'r'))
  end

  private


  def get_file_safe_name
    # The short hash is added so that when we remove chars we don't create the same system name for Joe and Joe!
    return @name if @name == 'default'
    @name.gsub(/[^a-z0-9_]+/i, '') + '_' + Digest::MD5.hexdigest(@name)[0...8]
  end






end