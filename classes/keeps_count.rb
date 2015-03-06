module KeepsCount

  def increment countable_thing
    pre countable_thing
    @counts[countable_thing.to_sym] += 1
  end

  def decrement countable_thing
    pre countable_thing
    @counts[countable_thing.to_sym] -= 1
  end

  def count_of countable_thing
    pre countable_thing
    @counts[countable_thing.to_sym]
  end


  private

  def pre countable_thing
    raise TypeError unless countable_thing.is_a? String or countable_thing.is_a? Symbol
    @counts ||= {}
    @counts[countable_thing.to_sym] ||= 0
  end

end