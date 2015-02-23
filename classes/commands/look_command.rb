require 'non_reflexive_command'

class LookCommand < NonReflexiveCommand

  def initialize words, actor = nil
    super

    @direct_object ||= @actor.location # default 'look around'

  end

  def execute
    Describe.call @direct_object, :in_detail, @actor
  end

end