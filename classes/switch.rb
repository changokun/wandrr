require 'player_awareness'
require 'item'

class Switch < Item

  include PlayerAwareness


  # command receiver.
  def activate actor, words
    @togglees ||= []

    # puts 'switch toggled.'
    # puts @togglees.to_yaml
    @togglees.each do | togglee |
      if togglee.respond_to? :toggle
        togglee.toggle
      else
        puts 'hmmm cannot toggle '.green + self.simple_label.red
      end
    end
    # puts 'switch toggled.'

  end

  def toggles item
    @togglees ||= []
    @togglees << item
  end

end