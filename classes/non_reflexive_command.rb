require 'command'

class NonReflexiveCommand < Command

  def initialize words, actor = nil
    super

    @direct_object ||= nil

    # is one of the words an object that can be looked at?
    verb = words.shift
    $player.debug_output 'What would Player like to ' + verb.red + '?'

    additional_input = Array.new(words)

    if @direct_object.nil?
      # we could list all the openable objects in the room, but that is part of the mystery of this game.
      while @direct_object.nil? do
        word = nil

        word = additional_input.shift if additional_input.length > 0

        if word.nil?
          $player.game.prompt 'What would you like to ' + verb.red + ' (at/to)?'
          word = ''
          until word.length > 0 do
            word = gets
            word.gsub! /[^a-z0-9\- ]+/i, ' '
            word.strip!
          end
        end

        # does word refer to anything in the room?
        # i guess that means loop thru everything in the room, one level deep.
        # atm that means only doors.
        @actor.location.doors.each do | door |
          @direct_object = door if door.could_be_called? word
        end

        if @direct_object.nil?
          # does word refer to room items?
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

end