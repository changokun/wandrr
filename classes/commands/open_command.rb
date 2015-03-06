require 'non_reflexive_command'

class OpenCommand < NonReflexiveCommand


  def execute

    if @direct_object.nil?
      puts @actor.name + ' opens nothing.'
    else
      puts @actor.name + ' opens ' + @direct_object.class.to_s + '.'

      # oh shit. this is the hard part.
      if @direct_object.respond_to? :open
        @direct_object.open @actor, @words
      else
        puts 'Hmmm. You cannot figure out a way to ' + @verb.magenta + ' the ' + @direct_object.simple_label.yellow
      end
    end

    post_execution
    
  end


end