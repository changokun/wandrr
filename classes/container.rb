
class Container
  def initialize
    @contents = []
  end

  def add addition
    @contents << addition
  end

  def remove thing
    if @contents.include? thing
      @contents -= thing
      return true
    else
      raise 
    end
  end
end
