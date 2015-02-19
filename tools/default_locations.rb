require_relative 'init'

pile = []
closet = Location.new('A closet')
closet.long_name = 'Your closet'
closet.descriptions = {:daylight => 'It is still pretty dark. You can feel some boxes and clothes.'}
pile << closet
pile << Location.new('bedroom')

locations = {}
pile.each do | loc | locations[loc.id] = loc end



File.open(File.join(Location::data_path, 'default_locations.yml'), 'w') do |file|
    file.puts YAML::dump(locations)
end

File.open(File.join(Location::data_path, 'default_locations.data'), 'w') do |file|
    file.puts Marshal::dump(locations)
end

puts 'two files written.'