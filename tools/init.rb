DATA_PATH = File.expand_path(File.join(__dir__, '../data'))
Dir::mkdir(DATA_PATH) unless Dir::exists? DATA_PATH

CLASS_PATH = File.expand_path(File.join(__dir__, '../classes'))


$LOAD_PATH << CLASS_PATH
$LOAD_PATH << File.join(CLASS_PATH, 'commands')


%w{colorize yaml digest}.each do | requirement |
  require requirement
end

# load all classes now? autoload went away, but I have no idea what to replace it with besides $LOAD_PATH and these commands.

Dir[File.join(__dir__, '../classes/**/*.rb')].each do | class_name |
  # print class_name.black
  require class_name
end


