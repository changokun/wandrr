require 'command'

class NonReflexiveCommand < Command

  def initialize words, actor = nil
    super

    @direct_object = nil

    # is one of the words an object that can be looked at?
    verb = words.shift
    $player.debug_output 'What would Player like to ' + verb.red + '?'

    if @direct_object.nil?
      words.each do | word |
        $player.debug_output 'Is there a(n) ' + word + ' to ' + verb.red + '?'
      end
    end

    if @direct_object.nil?
      # we could list all the openable objects in the room, but that is part of the mystery of this game.
      while @direct_object.nil? do
        $player.game.prompt 'What would you like to ' + verb.red + '?'
        response = ''
        until response.length > 0 do
          response = gets
          response.gsub! /[^a-z0-9\- ]+/i, ' '
          response.strip!
        end

        # does response refer to anything in the room?
        puts response
        # i guess that means loop thru everything in the room, one level deep.
        # atm that means only doors.
        @actor.location.doors.each do | door |
          @direct_object = door if door.could_be_called? response
        end

        if @direct_object.nil?
          # does response refer to room items?
        end

        if @direct_object.nil?
          # does response refer to anything on player's person?
        end

        if @direct_object.nil?
          # does response refer to anything at all? a person you could call? a memory?
        end

      end
    end

    if @direct_object.nil?
      puts 'We need to figure out how to get a direct object for your command, but we will roll without one for now'.green
    end

  end

end