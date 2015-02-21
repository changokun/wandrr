DATA_PATH = File.join(__dir__, '../data')
COMMAND_PATH = File.join(__dir__, '../commands')
SAVE_PATH = File.join(DATA_PATH, 'saves')




$LOAD_PATH << File.join(__dir__, '../classes')

require 'colorize'

print 'Loading classes'.black

%w{ yaml digest}.each do | requirement |
  require requirement
  print '.'.black
end

# load all classes now? autoload went away, but I have no idea what to replace it with besides $LOAD_PATH and these commands.

Dir[File.join(__dir__, '../classes/**/*.rb')].each do | class_name |
  require class_name
  print '.'.black
end



