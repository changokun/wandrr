require_relative 'init'

data = {}
data[:outfit] = Container.new

data[:current_location_id] = '2015-02-18_ab46be2cf3297e4d';


File.open(File.join(DATA_PATH, 'default_player.yml'), 'w') do |file|
    file.puts YAML::dump(data)
end

File.open(File.join(DATA_PATH, 'default_player.data'), 'w') do |file|
    file.puts Marshal::dump(data)
end

puts 'two default_player files written.'