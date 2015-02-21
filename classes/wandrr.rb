class Wandrr

  attr_reader :player

  def initialize player
    raise TypeError, 'Haters gonna hate, but only Players can play.' unless player.is_a? Player

    @player = player

    start
  end

  def start

    @player.debug_output 'starting the game'

    # Give the player a description of their outfit and their surroundings.
    Describe.call @player.location, :in_detail, @player
    Describe.call @player, :briefly, @player
    
    while true do
      run
    end
  end

  def stop
    @player.debug_output 'ending the game'
    abort "\n\nThanks for playing.\n\n"
  end

  def run
    prompt
    player_command = get_player_command
    unless player_command.is_a? SystemCommand
      act_as_player player_command
      describe_environment
      allow_other_beings_to_act
    else
      player_command.execute
    end
  end

  def prompt str = nil
    str ||= 'What would you like to do?'
    print "\n" + str + " > "
  end

  def get_player_command
    command = nil
    while ! command do
      raw_command = ''
      until raw_command.length > 0 do
        raw_command = gets.strip
      end
      command = CommandFactory::parse_input_string(raw_command, self)
      prompt 'Huh?' if command.nil?
    end
    puts '' unless @player.debug_output command.class.to_s + ' accepted.'
    return command
  end

  def act_as_player command
    # figure out the effect, change states of things/locations.
    @player.debug_output 'you are acting. things will probably change.', 2
    command.execute
  end

  def describe_environment
    # since this should not repeat things, it is only meant to describe what has changed. Perhaps each location should have a queue of information to be told to the player when the time is right. each action puts info in the queue, but you don't get to read it until this method runs - meaning that lots of things happen in between.
    # puts 'You are somewhere.'
  end

  def allow_other_beings_to_act
    puts 'Other things are happening. Birds chirp. Insects buzz. The wind blows.'
  end




end



