require_relative 'init'

pile = []
closet = Location.new('A closet')
closet.long_name = 'Your closet'
closet.illumination_level = IlluminationLevel::DARK
description_data = {
    0..19 => {
      :briefly => 'It feels like you are in a closet. You can feel some boxes and clothes.',
      :in_detail => 'It feels like you are in a closet. You can feel some boxes and clothes. It is maybe four feet deep and three feet across. A tiny amount of light creeps in under the door.'
    },
    20..99 => {
      :briefly => 'You are in a clothes closet. There are boxes and clothes hanging.',
      :in_detail => 'This clothes closet has several shoe boxes stacked up and dozens of mens shirts and jackets hanging on a rod.'
    }
  }
closet.set_descriptions description_data
closet.make_start_location true
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