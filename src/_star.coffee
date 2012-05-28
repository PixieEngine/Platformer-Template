# HEY LISTEN!
# This file is auto-generated, so editing it directly is a bad idea.
# Modify the entity that generated it instead!
Star = (I={}) ->
  Object.reverseMerge I, {
    "class": "Star",
    "parentClass": "GameObject",
    "sprite": "star",
    "__CODE": "self.on 'destroy', ->\n  player = engine.first('Player')\n  \n  player.I.stars += 1\n  \n  player.I.speed += 1",
    "uuid": "star"
  }

  self = GameObject(I)

  self.on 'destroy', ->
    player = engine.first('Player')
    
    player.I.stars += 1
    
    player.I.speed += 1

  return self