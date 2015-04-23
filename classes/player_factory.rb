

class PlayerFactory

  def self.set_player_by_name name

    # if we have save files, they should contain completely resuscitatable players.
    # for now, the player save file includes the entire world, even if there is no significant difference between it and the original starting world.


    file_safe_name = self.get_file_safe_name(name)

    begin
      $player = Marshal::load(File.open(File.join(SAVE_PATH, file_safe_name + '.data'), 'r'))
      $player.debug_output 'Found save file: ' + file_safe_name.red
      puts 'Ah yes, I remember you, ' + $player.name
    rescue
      puts 'I see... ' + name + ' is new here.'
      begin
        $player = Marshal::load(File.open(File.join(DATA_PATH, 'starting_player.data'), 'r'))
        $player.debug_output 'Loading fresh meat'
        $player.set_name name
        $player.file_safe_name = file_safe_name
      rescue
        abort "No data files found. Please run ".red + "ruby tools/make_defaults.rb".yellow + " then try again.".red
      end
    end

    $locations = $player.locations
    $portals = $player.portals

  end


  def self.save_player

    # if we have save files, they should contain completely resuscitatable players.
    # for now, the player save file includes the entire world, even if there is no significant difference between it and the original starting world.


    file_safe_name = self.get_file_safe_name($player.name('undecorated'))

    begin
      File.open(File.join(SAVE_PATH, file_safe_name + '.data'), 'w') do |file|
          file.puts Marshal::dump($player)
          puts "#{$player.name} data saved as binary data, so that we have an obfuscated version (which is what really gets loaded).".green
      end
      File.open(File.join(SAVE_PATH, file_safe_name + '.yml'), 'w') do |file|
          file.puts YAML::dump($player)
          puts "#{$player.name} data saved as YAML, so that we have a human-readable version (do not bother with editing it).".green
      end
    rescue
      puts "Oh no! We could not save your shit.".red
    end

  end

  def self.save_fresh_starting_player_data player

    File.open(File.join(DATA_PATH, 'starting_player.data'), 'w') do |file|
        file.puts Marshal::dump(player)
        puts 'Fresh player data saved as binary data, so that we have an obfuscated version (which is what really gets loaded).'
    end

    File.open(File.join(DATA_PATH, 'starting_player.yml'), 'w') do |file|
        file.puts YAML::dump(player)
        puts 'Fresh player data saved as YAML, so that we have a human-readable version (do not bother with editing it).'
    end

  end

  private

  def self.get_file_safe_name name
    # The short hash is added so that when we remove chars we don't create the same system name for Joe and Joe!
    name.gsub(/[^a-z0-9_]+/i, '') + '_' + Digest::MD5.hexdigest(name)[0...8]
  end


end

# make sure player saves folder exists.
SAVE_PATH = File.join(DATA_PATH, 'saves')
Dir::mkdir(SAVE_PATH) unless Dir::exists? SAVE_PATH
