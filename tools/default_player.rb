require_relative 'init'

data = {}
data[:outfit] = Container.new

data[:location_pointer] = 'closet'


File.open(File.join(DATA_PATH, 'default_player.yml'), 'w') do |file|
    file.puts YAML::dump(data)
end

File.open(File.join(DATA_PATH, 'default_player.data'), 'w') do |file|
    file.puts Marshal::dump(data)
end

puts 'two default_player files written.'