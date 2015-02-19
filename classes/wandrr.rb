class Wandrr

  def initialize player
    raise TypeError, 'Haters gonna hate, but only Players can play.' unless player.is_a? Player

    @player = player

    start
  end

  def start

    # Give the player a description of their outfit and their surroundings.

    Describe::briefly @player
    Describe::briefly @player.location
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
      command = CommandFactory::parse_input_string(raw_command, self)
      puts 'Huh?' if command.nil?
    end
    return command
  end

  def act_as_player command
    # figure out the effect, change states of things/locations.
    puts 'you are acting. things will probably change.'
    command.execute
  end

  def describe_environment
    # since this should not repeat things, it is only meant to describe what has changed. Perhaps each location should have a queue of information to be told to the player when the time is right. each action puts info in the queue, but you don't get to read it until this method runs - meaning that lots of things happen in between.
    puts 'You are somewhere.'
  end

  def allow_other_beings_to_act
    puts 'Other things are happening.'
  end




end

