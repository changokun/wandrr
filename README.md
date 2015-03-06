# wandrr
This should do it:
* bundle install
* ruby wander.rb
* tell it your name
* type 'help'

Recent innovations - try these commands
* look door
* move boxes
* open door
* go door
* go closet
* kill boxes (maniacs only)
* yam chain

Items have a short list of labels that the player can use in their commands. The default label is the class name, but others can be added. eg the switch in the closet is better known as a pullchain, but will also respond to 'chain'

Tasks:
* In some cases, going through a door should automatically open it. but in some special cases, this should not happen.
* Observers - attach and remove as events happen - each location, being, and item may have a set of observers that listen for events. A simple first generation might be to ... have Hank get annoyed when the player belches. Ruby Stdlib has a ObserverModule. this is in play for now.
* Counters - minimally implemented. Try belching a few times. Let's count how many times Player has been to a location. How many times each command (base class) has been given.
* Implement Save. remove some meaningless stuff from objects as noted in some parts of the code. then do the double save - Marshal and Yaml. (Yaml so we can read it.) This is important because we need to make sure we aren't creating things that cannot be saved (like Procs/lambdas), and if we do, find another strategy.
* Modify exit commands to check for and offer a save.
* Hints? I don't want explicit hints, but well narrated ones will work.
* Easier object creation. It is currently done by the 'make_defaults.rb' - if this game is to be easy to make content for, we need to replace this reliance on script. 
* Ghosts and other ethereal objects that can only be perceived by those with a gift. I want a ghost in the closet who cannot be seen nor heard in anyway. unless you go get the magic amulet that allows you to see them. Hank has been added. The only way to see him at this point is to yam hank. hee hee
* containers with things in them.
* outfits for beings.
* carry things.
* equip things.

