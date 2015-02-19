class Describe

  def self.briefly obj
    puts 'It is a(n) ' + obj.class.to_s
  end

  def self.in_detail obj
    puts 'Well, this is clearly a(n) ' + obj.class.to_s + ', which should have properties, attributes, containers, etc.'
  end

end