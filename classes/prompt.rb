class Prompt

  PROMPT_FINIAL_STANDARD = ' > '.magenta

  def self.call prompt_str = 'You order now', escapable = true
    print prompt_str + PROMPT_FINIAL_STANDARD

    raw_input = ''
    begin
      state = `stty -g`
      `stty raw -echo -icanon isig`
      while true do
        single_character = STDIN.getc.chr
        break if single_character.ord == 13 && (raw_input.length > 0 || escapable)
        if single_character.ord == 127
          if raw_input.length > 0
            print "\b \b"
            raw_input = raw_input[0...-1]
          end
          redo
        end
        # print '[' + single_character + '#' + single_character.ord.to_s + '|'
        single_character = '' unless /[a-z0-9 ]/i =~ single_character
        #print single_character + ']'
        print single_character
        raw_input += single_character
      end
    ensure
      `stty #{state}`
    end

    raise NevermindError if escapable && ['', 'nvm', 'nevermind'].include?(raw_input) # just hit return to escape/nvm
    
    raw_input.gsub! /[\s]+/, ' '
    $player.debug_output '>' + raw_input + '<' 
    raw_input
  end

end