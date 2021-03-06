class CommandFactory
  def self.parse_input_string str
    $player.debug_output %Q(Trying to figure out what you want when you say, "#{str}."), 2

    return nil unless str.length > 0

    words = str.split(/\s+/)
    potential_command_class_name = "#{words.first.capitalize}Command"

    return nil unless Object.const_defined?(potential_command_class_name)

    command_class = Object.const_get potential_command_class_name
    command_class.new words
  end
end
