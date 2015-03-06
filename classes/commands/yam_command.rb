require 'non_reflexive_command'

class YamCommand < NonReflexiveCommand


  # this is a copy. dont do any serious work here.
  def initialize words, actor = nil
    @words = words
    @actor = actor
    @actor ||= $player
    @verb = self.class.to_s.downcase.gsub 'command', ''

    @direct_object ||= nil

    additional_input = Array.new(words)
    additional_input.shift # remove first word

    if @direct_object.nil?
      # we could list all the openable objects in the room, but that is part of the mystery of this game.
      while @direct_object.nil? do
        word = nil

        word = additional_input.shift if additional_input.length > 0

        word = Prompt.call "What would you like to see in #{'YAML'.red} format?" if word.nil?

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
            @direct_object = item if item.could_be_called? word 
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
    puts @direct_object.to_yaml
  end
  
end

