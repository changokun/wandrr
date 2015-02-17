DATA_PATH = File.join(__dir__, '../data')
SAVE_PATH = File.join(DATA_PATH, 'saves')


$LOAD_PATH << File.join(__dir__, '../classes')

print 'Loading classes'

%w{colorize yaml digest}.each do | requirement |
  require requirement
  print '.'
end

# load all classes now? autoload went away, but I have no idea what to replace it with besides $LOAD_PATH and these commands.

Dir[File.join(__dir__, '../classes/**/*.rb')].each do | class_name |
  require class_name
  print '.'
end

