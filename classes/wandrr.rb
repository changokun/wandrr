class Wandrr

  def initialize player
    raise TypeError, 'Haters gonna hate, but only Players can play.' unless player.is_a? Player

    #move worlds definition out of player and into game, to make player lighter for passing around.
    @player = player
    @worlds = @player.worlds
    @player.worlds = nil

    start
  end

  def start

    # Give the player a description of their outfit and their surroundings.
    while true do
      run
    end
  end

  def stop
    abort "\n\nThanks for playing.\n\n"
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

