require_relative 'init'

class Wandrr

  def initialize

    load_default_data
    load_player_data 

    start
  end

  def start
    while true do
      run
    end
  end

  def stop
    abort "\n\nThanks for playing.\n\n"
  end

  def load_default_data

    print 'Loading default data '
    @locations = YAML.load_file('data/default_locations.yml')
    print '.'
    # @data = YAML.load_file('data/default.yml')
    # print '.'
    # p @data


    print " done.\n"

  end

  def load_player_data
    puts 'Loading your data has not been worked out just yet.'
  end
  
  def run
    prompt
    player_command = get_player_command
    p player_command
    act_as_player player_command
    describe_environment
    allow_other_beings_to_act
  end

  def prompt
    puts 'What would you like to do?'
  end

  def get_player_command
    command = nil
    while ! command do
      raw_command = gets.chomp
      if raw_command == 'die'
        command = ReflexiveCommand.new('die')
      else
        puts 'Huh?'
      end
    end
    return command
  end

  def act_as_player command
    # figure out the effect, change states of things/locations.
    puts 'you are acting. things will probably change.'
    command.execute self
  end

  def describe_environment
    puts 'You are somewhere.'
  end

  def allow_other_beings_to_act
    puts 'Other things are happening.'
  end




end



puts 'hiya. what is yer name?'

name = gets.chomp

puts 'I thought so. Go die, ' + name

game = Wandrr.new



