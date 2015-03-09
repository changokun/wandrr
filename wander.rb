require_relative 'tools/init'
require 'pry'

puts "\n\n=====\nHello."

satisfied = false
while not satisfied do
  print 'What is your name? > '
  raw_input = gets.chomp
  name = raw_input.gsub /[^a-z0-9\-’ ]+/i, ''
  if name.length > 20
    puts 'That’s too long. Try again.'
  elsif name.length < 3
    puts 'That’s too short. Try again.'
  elsif name != raw_input
    print 'Hmmm ... How about ' + name.red + '? [ok/no]'
    response = gets.chomp
    satisfied = true if response == 'ok'
  else
    satisfied = true
  end

end


puts "\nLet me see what I know about you, " + name.magenta + '...'

PlayerFactory::set_player_by_name(name)

game = Wandrr.new



  
