require 'command'

class NonReflexiveCommand < Command

  def initialize words, actor = nil
    super

    @direct_object ||= nil

    # is one of the words an object that can be looked at?
    $player.debug_output 'What would Player like to ' + @verb.red + '?'

    additional_input = Array.new(words)

    if @direct_object.nil?
      # we could list all the openable objects in the room, but that is part of the mystery of this game.
      while @direct_object.nil? do
        word = nil

        word = additional_input.shift if additional_input.length > 0

        if word.nil?
          $player.game.prompt 'What would you like to ' + @verb.red + ' (at/to)?'
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
          @actor.location.contents.each { | item | @direct_object = item if item.could_be_called? word }
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
      puts @actor.name + ' ' + @verb + 's nothing.'
    else
      puts @actor.name + ' ' + @verb + 's ' + @direct_object.simple_label + '.'

      # oh shit. this is the hard part.
      if @direct_object.respond_to? @verb.to_sym
        @direct_object.send @verb, [@actor, @words]
      elsif @direct_object.respond_to? :respond # which would be a method that takes the verb and actor, etc, and can handle the command.
        raise 'respond methods not yet written' # unnec, i know.
      elsif defined?(@direct_object.response_narratives) && @direct_object.response_narratives.respond_to?(:key?) && @direct_object.response_narratives.key?(@verb.to_sym)
        puts @direct_object.response_narratives[@verb.to_sym]
      elsif defined?(@direct_object.response_narratives) && @direct_object.response_narratives.respond_to?(:key?) && @direct_object.response_narratives.key?(:any)
        puts @direct_object.response_narratives[:any]
      else
        puts 'Hmmm. You cannot figure out a way to ' + @verb.magenta + ' the ' + @direct_object.simple_label.yellow
      end
    end
  end



end