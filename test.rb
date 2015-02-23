
module HasFleas

  def get_itchy
    puts 'scrtcha scrtcha scrtcha scrtcha scrtcha '
  end

  def self.has_fleas
    puts 'often!'
    true
  end

end


class Animal

  def vocalize
    puts 'grunt or something'
  end

  def self.has_fleas
    puts 'generally, no.'
  end

end


class Dog < Animal

  extend HasFleas

  def vocalize
    puts 'woof'
  end

end


Animal::has_fleas
Dog::has_fleas



