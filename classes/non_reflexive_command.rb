require 'command'

class NonReflexiveCommand < Command

  def initialize words, actor = nil
    super

    @direct_object ||= nil

    # is one of the words an object that can be looked at/pushed around/killed, etc?
    $player.debug_output 'What would Player like to ' + @verb.red + '?'

    additional_input = Array.new(words)
    additional_input.shift # remove first word

    if @direct_object.nil?
      # we could list all the openable objects in the room, but that is part of the mystery of this game.
      while @direct_object.nil? do
        word = nil

        word = additional_input.shift if additional_input.length > 0

        word = Prompt.call 'What would you like to ' + @verb.red + ' (at/to)?' if word.nil?

        # does word refer to anything in the room?
        # i guess that means loop thru everything in the room, one level deep.
        # atm that means only doors.
        @actor.location.doors.each do | door |
          @direct_object = door if door.could_be_called? word
        end

        if @direct_object.nil?
          # does word refer to room items?
          @actor.location.contents.each { | item | 
            # puts item.to_yaml
            @direct_object = item if item.could_be_called? word # and is visible. ie... has a desciption set for this light level
          }
        end

        if @direct_object.nil?
          # does word refer to anything on player's person?
        end

        if @direct_object.nil?
          # does word refer to anything at all? a person you could call? a memory?
        end

        if @direct_object.nil?
          puts 'I’m not sure there is a(ny) ' + word.red + ' here.'
        end

      end
    end

    if @direct_object.nil?
      puts 'We need to figure out how to get a direct object for your command, but we will roll without one for now'.green
    end

  end




  def execute
    if @direct_object.nil?
      puts @actor.name + ' ' + @verb + 's nothing. ' + '(This is a kind of error, right?)'.black
    else
      $player.debug_output @actor.name + ' ' + @verb + 's ' + @direct_object.simple_label + '.'

      # oh shit. this is the hard part.
      # first, if the verb is something that the object was born to do, it will have a method by that name - eg a door will open
      if @direct_object.respond_to? @verb.to_sym
        @direct_object.send @verb, @actor, @words

      # otherwise it needs to have responses handled by the responds module
      elsif @direct_object.respond_to? :respond
        @direct_object.respond @verb, @actor, @words
           
      else
        admit_defeat     
      end
    end
  end

  def admit_defeat
    puts 'Hmmm. You cannot figure out a way to ' + @verb.magenta + ' the ' + @direct_object.simple_label.yellow
  end


end