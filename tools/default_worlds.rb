require_relative 'init'

worlds = []

world = Location.new('world')
world.add_location(Location.new('North America'))
world.add_location(Location.new('South America'))
world.add_location(Location.new('Africa'))
world.add_location(Location.new('Europe'))
world.add_location(Location.new('Asia'))
worlds << world
worlds << Location.new('heaven')
worlds << Location.new('hell')
worlds << Location.new('38th Street')


File.open(File.join(DATA_PATH, 'default_worlds.yml'), 'w') do |file|
    file.puts YAML::dump(worlds)
end

File.open(File.join(DATA_PATH, 'default_worlds.data'), 'w') do |file|
    file.puts Marshal::dump(worlds)
end

puts 'two default_worlds files written.'