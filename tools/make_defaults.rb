require_relative 'init'





player = Player.new # all our saves will now be in the default dir.

description_data = {
  0..19 => {
    :any => 'It is too dark to see your hand in front of your face.'
  },
  20..99 => {
    :briefly => 'You seem to be wearing pajamas.',
    :in_detail => 'You seem to be wearing pajamas, or some other softish full-body outfit. It covers your arms and legs.',
  }
}

player.set_descriptions description_data





closet = Location.new('A closet')
closet.long_name = 'Your closet'
# this old iullume needs to come out
closet.set_shine_level IlluminationLevel::ABSOLUTE_DARK # hmmmm 0 should be the default anyway.
description_data = {
    0..19 => {
      :briefly => 'It feels like you are in a closet. You are competing for space with some hanging clothes.',
      :in_detail => 'It feels like you are in a closet. You are among dozens of hanging clothing items. It is maybe four feet deep and three feet across.'
    },
    20..99 => {
      :briefly => 'You are in a clothes closet. There many clothing items hanging.',
      :in_detail => 'This clothes closet has dozens of mens shirts and jackets hanging on a rod. It is maybe four feet deep and three feet across.'
    }
  }
closet.set_descriptions description_data

boxes = Item.new 'Some shoeboxes are stacked in a corner.'
boxes.might_be_called %w{box boxes shoeboxes}
boxes.add_response [:move, :push, :pull], 'There isn’t much room. You shift the boxes a few inches, but nothing happens.'
boxes.add_response :any, 'Really? They are just some old shoeboxes. Nothing happens.'
boxes.add_response :kill, Response.new(:game, :stop, 'Really? You want to kill the shoe box? You must be a maniac. You will not enjoy this game. Go find something else to do.')
closet.contents.add boxes

# add switch and light. maybe as same object? no - i want switches to toggle multiple things.
light = Light.new
light.does_not_get_described
light.is_lit! 40 # sets light level
light.is_out! # but we want it out. # todo

pullchain = Switch.new
pullchain.might_be_called %w{pullchain chain pull_chain} # underscores not worked out yet
pullchain.toggles light
description_data = {
    # can't find it in abs dark
    10..19 => { 
      :any => 'A thin chain dangles from above.'
    },
    20..99 => {
      :any => 'A thin pull chain dangles from a light in the cieling.'
    }
  }
pullchain.set_descriptions description_data
closet.contents.add light
closet.contents.add pullchain

player.locations[closet.id] = closet
# set starting point for new games:
player.set_location_id closet.id





bedroom = Location.new('A bedroom')
bedroom.long_name = 'Your bedroom'
bedroom.set_shine_level IlluminationLevel::MODERATE
description_data = {
    0..99 => {
      :briefly => 'You are in a bedroom. You can tell this because there is a bed.',
      :in_detail => 'You are in a sparse bedroom. A queen-sized bed, pushed against the wall, is neatly made with an orange blanket on top and two pillows. The walls are also orange.'
    }
  }
bedroom.set_descriptions description_data


player.locations[bedroom.id] = bedroom


# let us connect those two.
# need two Door objects - not really. same door both sides.
door = Door.new
description_data = {
    0..19 => {
      :briefly => 'Light breaks in under a door.',
      :in_detail => 'Light breaks in under a normal interior house door. There is a door knob.'
    },
    20..99 => {
      :briefly => 'There is a normal household door.',
      :in_detail => 'A normal interior house door. Twisting a round knob to one side will open it. It seems to be painted white.'
    }
  }
door.set_descriptions description_data
door.might_be_called %w{door bedroom-door}
door.set_shine_level IlluminationLevel::DARK # some light coming in under the door
portal = Portal.new closet, door, bedroom, door

player.portals[portal.id] = portal











PlayerFactory::save_fresh_starting_player_data player

puts "\nSome files saved.\n\n"
