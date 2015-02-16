require_relative '../init'


closet = Location.new('A closet')
closet.long_name = 'Your closet'
closet.descriptions = {:daylight => 'It is still pretty dark. You can feel some boxes and clothes.'}

locations = []
locations << closet


File.open(File.join(DATA_PATH, 'default_locations.yml'), 'w') do |file|
    file.puts YAML::dump(locations)
end

File.open(File.join(DATA_PATH, 'default_locations.data'), 'w') do |file|
    file.puts Marshal::dump(locations)
end

puts 'two files written.'