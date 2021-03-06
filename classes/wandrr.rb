class Wandrr

  def initialize
    raise 'Haters gonna hate, but only Players can play. Must have $player global set.' unless $player.is_a? Player

    start
  end

  def start

    $player.debug_output 'starting the game'

    # give the player a reference to the game
    $player.game = self

    puts "\nOkay, here we go. Type #{'help'.magenta} to see the basic commands.\n\n"

    # Give the player a description of their outfit and their surroundings.
    Describe.call $player.location, :briefly
    Describe.call $player, :briefly

    $player.location.contents.each do | item |
      $player.add_observer(item) if item.is_a? Observable
    end
    
    
    while true do
      begin
        run
      rescue StandardError => e
        puts "\nOH NOES -----".green
        puts e.class.to_s.magenta + ' ' + e.message.red
        puts e.backtrace.first.red
        puts "TRY AGAIN -----".green
      end
    end
  end

  def stop
    $player.debug_output 'ending the game'
    puts "\nThanks for playing.\n\n".green
    exit # exits with a 0
  end

  def run
    player_command = prompt_for_command
    unless player_command.is_a? SystemCommand
      act_as_player player_command
      describe_environment
      allow_other_beings_to_act
    else
      player_command.execute
    end
  end

  def prompt_for_command
    command = nil
    begin
      until command do
        raw_command = Prompt.call "\nWhat would you like to do?", false
        command = CommandFactory::parse_input_string raw_command
        if command.nil?
          puts 'I do not understand.'.green
        end
      end
    rescue NevermindError
      command = NullCommand.new [], 'system'
    end
    # puts '' unless 
    $player.debug_output command.class.to_s + ' accepted.'
    return command
  end

  def get_player_command
  end

  def act_as_player command
    # figure out the effect, change states of things/locations.
    $player.debug_output 'you are acting. things will probably change.', 2
    command.execute
  end

  def describe_environment
    # since this should not repeat things, it is only meant to describe what has changed. Perhaps each location should have a queue of information to be told to the player when the time is right. each action puts info in the queue, but you don't get to read it until this method runs - meaning that lots of things happen in between.
    # puts 'You are somewhere.'
  end

  def allow_other_beings_to_act
    # puts 'Other things are happening. Birds chirp. Insects buzz. The wind blows.'
  end




end


class NevermindError < StandardError
end
