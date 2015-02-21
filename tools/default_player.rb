require_relative 'init'

data = {}
data[:outfit] = Container.new

data[:descriptions] = {
  0..19 => {
    :any => 'It is too dark to see your hand in front of your face.'
  },
  20..99 => {
    :briefly => 'You seem to be wearing pajamas.',
    :in_detail => 'You seem to be wearing pajamas, or some other softish full-body outfit. It covers your arms and legs.',
  }
}


File.open(File.join(DATA_PATH, 'default_player.yml'), 'w') do |file|
    file.puts YAML::dump(data)
end

File.open(File.join(DATA_PATH, 'default_player.data'), 'w') do |file|
    file.puts Marshal::dump(data)
end

puts 'two default_player files written.'