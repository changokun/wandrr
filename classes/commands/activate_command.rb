require 'command'
require 'non_reflexive_command'

# hmm activate will be the parent class of commands that are intended to toggle something or turn a dial or pull a lever or whatever.

class ActivateCommand < NonReflexiveCommand

  def initialize words, actor = nil
    super
    @verb = 'activate'
  end

end


PushCommand = Class.new(ActivateCommand)
PullCommand = Class.new(ActivateCommand)
