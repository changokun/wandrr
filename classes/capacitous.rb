
module Capacitous

  def add addition
    @contents ||= Contents_.new
    #todo check that addition is carriable or small enough
    @contents[addition.id] = addition
  end

  def contents
    @contents ||= Contents_.new
  end

  def remove thing
    raise 'not yet ready'
  end
end



class Contents_
  def initialize
    @contents = {}
  end
  def add item
    raise if item.id.nil?
    @contents[item.id] = item
  end
  def each
    @contents.each {| id, item | yield(item) }
  end
end
