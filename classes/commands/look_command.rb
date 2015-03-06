require 'non_reflexive_command'

class LookCommand < NonReflexiveCommand

  def initialize words, actor = $player
    @actor = actor

    # we may resolve DO here and now.... if no additional words, DO is location
    if words.length == 1 # ["look"]
      @direct_object ||= @actor.location # default 'look around'
    end

    super

  end

  def execute
    Describe.call @direct_object, :in_detail, @actor

    post_execution
  end

end


