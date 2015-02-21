class DescribeItem

  def self.call item, depth, actor
    if item.respond_to? :describe
      item.describe depth, actor
    else
      case actor.location.illumination_level
      when 0..9
        puts 'It is too dark to know anything about this.' #except bulk?
      else
        puts 'This is a(n) ' + item.class.to_s + '. Someone needs to add some narrative.'
      end
    end
  end
end