require_relative 'init'





pile = []
portals = []


closet = Location.new('A closet')
closet.long_name = 'Your closet'
closet.illumination_level = IlluminationLevel::DARK
description_data = {
    0..19 => {
      :briefly => 'It feels like you are in a closet. You can feel some boxes and clothes.',
      :in_detail => 'It feels like you are in a closet. You can feel some boxes and clothes. It is maybe four feet deep and three feet across. A tiny amount of light creeps in under the door.'
    },
    20..99 => {
      :briefly => 'You are in a clothes closet. There are boxes and clothes hanging.',
      :in_detail => 'This clothes closet has several shoe boxes stacked up and dozens of mens shirts and jackets hanging on a rod.'
    }
  }
closet.set_descriptions description_data
pile << closet




bedroom = Location.new('A bedroom')
bedroom.long_name = 'Your bedroom'
bedroom.illumination_level = IlluminationLevel::MODERATE
description_data = {
    0..99 => {
      :briefly => 'You are in a bedroom. You can tell this because there is a bed.',
      :in_detail => 'You are in a sparse bedroom. A queen-sized bed, pushed against the wall, is neatly made with an orange blanket on top and two pillows. The walls are also orange.'
    }
  }
bedroom.set_descriptions description_data

pile << bedroom


# let us connect those two.
# need two Door objects - not really. same door both sides.
door = Door.new
description_data = {
    0..99 => {
      :briefly => 'a normal door.',
      :in_detail => 'A normal house door. Twisting a round knob to one side will open it. It is probably painted white. Jeez.'
    }
  }
door.set_descriptions description_data
portal = Portal.new closet, door, bedroom, door

portals << portal



locations = {}
pile.each do | loc | locations[loc.id] = loc end







player = Player.new 'default' # all our saves will now be in the default dir.

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

# set starting point for new games:
player.set_location_id closet.id

player.save

player.save locations

player.save portals

puts "\nSome files saved.\n\n"