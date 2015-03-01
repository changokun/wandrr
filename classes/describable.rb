module Describable

  # first key is illumination level. 0 is dark, 100 is too bright.
  # second key is how much detail we want.
  # :all will always be returned (in addition to any description found at the appropriate depth indication)
  # :any will be returned if no matching depth is found.
  # :briefly think sms. 100 chars?
  # :detail - this will often be used for the first time you look at something, and again later when requested specially.

  # let classes set their own default descriptions
  # @description_data = {
 #    0..19 => {
 #      :any => 'It is too dark to see anything about this.'
 #    },
 #    20..99 => {
 #      :briefly => 'This is a thing. Someone should write a description for it.',
 #      :in_detail => 'This is a thing, or maybe a person. a dog? who knows? Someone should write a description for it with the details you seek.',
 #    }
 #  }

  def might_be_called labels
    @labels_player_might_use_to_refer_to_this ||= [self.class.to_s.downcase]
    # todo soften things like plurals and misspleeings.
    @labels_player_might_use_to_refer_to_this.push *labels
  end

  def is_describable?
    # todo test that we have description_data or can inherit it.
    true
  end

  def could_be_called? label
    @labels_player_might_use_to_refer_to_this ||= [self.class.to_s]
    # todo soften things like plurals and misspleeings.
    @labels_player_might_use_to_refer_to_this.include? label
  end

  def simple_label
    @labels_player_might_use_to_refer_to_this ||= [self.class.to_s]
    return @labels_player_might_use_to_refer_to_this[0] if @labels_player_might_use_to_refer_to_this.length > 0
    return self.class.to_s
  end

  def describe depth, actor = nil
    actor ||= $player
    #for now, assumin actor is player, but that will need to be expanded later. so that other characters can look at things/other beings and see if they are well-armed, or wearing the magic amulet, or on the same/wrong team or very valuable or whatever.

    $player.debug_output __method__.to_s + ' ' + self.class.to_s + ' ' + depth.to_s + ' to ' + actor.class.to_s + '(illum: ' + actor.location.get_illumination_level.to_s + ').'

    @description_data.each do | illumination_level, descriptions |
      if illumination_level.include? actor.location.get_illumination_level
        puts descriptions[:all] if descriptions.key? :all
        if descriptions.key? depth
          puts descriptions[depth]
        elsif descriptions.key? :any
          puts descriptions[:any]
        end
      end
    end

  end

  def set_descriptions descriptions
    @description_data = descriptions
  end

  def does_not_get_described
    # maybe this should be a flag so that we don't erase data we want to discribe with later.
    @description_data = {}
  end

  def add_description description, illumination_level=0..99, depth=:any
    @description_data = {} unless self.instance_variable_defined? :@description_data
    @description_data[illumination_level] = {} unless @description_data.key? illumination_level
    
    if @description_data[illumination_level].key? depth
      @description_data[illumination_level][depth] += ' FURTHERMORE ' + description
    else
      @description_data[illumination_level][depth] = description
    end

  end

  private




end