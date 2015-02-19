require 'articulate_animal'
require 'digest'

class Player < ArticulateAnimal

  attr_accessor :worlds

  def initialize name
    super
    @name = name
    # The short hash is added so that when we remove chars we don't create the same system name for Joe and Joe!
    @system_name = name.gsub(/[^a-z0-9]+/i, '') + '_' + Digest::MD5.hexdigest(name)[0...8]
    @save_dir = File.join(SAVE_PATH, @system_name)

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

  private

  def load

    if self.save_file_exists
      puts 'Loading a save file that I found...'
      data = YAML.load_file(save_file_name)
    else
      puts 'Let’s start you off right...'
      data = YAML.load_file(default_file_name)
    end

    @current_location_id = data[:current_location_id]
    @outfit = data[:outfit]

  end

end