module Describable

  # first key is illumination level. 0 is dark, 100 is too bright.
  # second key is how much detail we want.
  # :all will always be returned (in addition to any description found at the appropriate depth indication)
  # :any will be returned if no matching depth is found.
  # :briefly think sms. 100 chars?
  # :detail - this will often be used for the first time you look at something, and again later when requested specially.

  # let classes set their own default descriptions
	@description_data = {}
  # @description_data = {
 #    0..19 => {
 #      :any => 'It is too dark to see anything about this.'
 #    },
 #    20..99 => {
 #      :briefly => 'This is a thing. Someone should write a description for it.',
 #      :in_detail => 'This is a thing, or maybe a person. a dog? who knows? Someone should write a description for it with the details you seek.',
 #    }
 #  }

  def is_describable?
    # todo test that we have description_data or can inherit it.
    true
  end

  def describe depth, actor = nil
    actor ||= $player
    #for now, assumin actor is player, but that will need to be expanded later. so that other characters can look at things/other beings and see if they are well-armed, or wearing the magic amulet, or on the same/wrong team or very valuable or whatever.

    actor.debug_output __method__.to_s + ' ' + self.class.to_s + ' ' + depth.to_s + ' to ' + actor.class.to_s + ' (lighting: ' + actor.location.illumination_level.to_s + ')'
    # p @description_data

    @description_data.each do | illumination_level, descriptions |
      if illumination_level.include? actor.location.illumination_level
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

  private




end