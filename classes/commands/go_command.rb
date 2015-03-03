require 'reflexive_command'

class GoCommand < ReflexiveCommand


  def initialize words, actor = nil
    super

    @destination ||= nil

    # is one of the words an object that can be looked at/pushed around/killed, etc?
    $player.debug_output 'Where would Player like to ' + @verb.red + '?'

    additional_input = Array.new(words)
    additional_input.shift # remove first word

    if @destination.nil?
      # we could list all the openable objects in the room, but that is part of the mystery of this game.
      while @destination.nil? do
        word = nil

        word = additional_input.shift if additional_input.length > 0

        word = Prompt.call 'Where would you like to ' + @verb.red + ' (to)?' if word.nil?

        # does word refer to any doors in the room?
        # i guess that means loop thru everything in the room, one level deep.
        # atm that means only doors.
        @actor.location.doors.each do | door |
           
          if door.could_be_called? word
            if door.is_a? PlayerAwareness
              if door.is_known?
                @destination = door.destination
              end
            else
              @destination = door.destination
            end
          end
        end

        if @destination.nil?
          # does word refer to a cardinal direction? north south east west n s e w
        end

        if @destination.nil?
          # does word refer to a relative direction? left right up down l r u d
        end

        if @destination.nil?
          puts 'I’m not sure that you can ' + @verb.red + ' that way.'
        end

      end
    end

    if @destination.nil?
      puts 'We need to figure out how to get a destination for your journey, but we will roll without one for now'.green
    end

  end



  def execute
    puts @verb.green + '-ing to ' + @destination.name + '.'
    @actor.change_location @destination
  end

end

# aliases?
class LeaveCommand < DieCommand 
end
class WalkCommand < DieCommand 
end
class RunCommand < DieCommand 
end
class FleeCommand < DieCommand 
end


