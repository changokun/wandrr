module Responds
  # this is handling responses as a direct object. we may need another for reflexive verbs.
  def respond verb, actor, words
    @responses ||= {}
    puts "responding: #{actor.name} is #{(verb + '-ing').red} #{self.simple_label}"

    if @responses.key? verb.to_sym
      process_response @responses[verb.to_sym], verb, actor, words
    elsif @responses.key? :any
      process_response @responses[:any], 'any', actor, words
    else
      puts "Nothing happens." + " #{self.simple_label} probably needs some responses.".black
    end
  end

  def add_response verbs, actions
    @responses ||= {}
    verbs = verbs.to_sym if verbs.is_a? String
    verbs = [verbs] if verbs.is_a? Symbol
    verbs.each do |verb|
      @responses[verb] = actions
    end
  end

  def add_responses data
    @responses ||= {}
    @responses.merge! data
  end

  private

  def process_response response, verb, actor, words
    # if response is just a string, it is just some narrative.
    if response.is_a? String
      puts response
    elsif response.is_a? Response
      # responder is a symbol or something that refers to something in the game. could be an id, idk.
      puts response.narrative.green
      if response.responder == :game
        responder = $player.game
        if responder.respond_to? response.method
          responder.send response.method.to_sym
        else
          puts "#{response.method.to_s} not available on game."
          p responder
        end
      else
        p response
        puts 'waht should i do with that?'.green
      end
    else
      p response
      puts 'waht should i do with that response?'.green
    end
  end
end
