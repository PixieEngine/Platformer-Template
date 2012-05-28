# HEY LISTEN!
# This file is auto-generated, so editing it directly is a bad idea.
# Modify the entity that generated it instead!
Star = (I={}) ->
  Object.reverseMerge I, {
    "class": "Star",
    "parentClass": "GameObject",
    "sprite": "star",
    "__CODE": "index = 0\n\nself.on 'destroy', ->\n  player = engine.first('Player')\n  \n  unless I.x > engine.camera().I.cameraBounds.width \n    player.I.stars += 1\n    player.I.speed += 1\n    \n    engine.add 'FloatingTextEffect'\n      x: I.x - 40\n      y: I.y - 40\n      text: [\n        \"Nothings\"\n        \"Gonna\"\n        \"Stop\"\n        \"Me\"\n        \"Now\"\n      ].wrap(index)\n      \n      index += 1\n      ",
    "uuid": "star"
  }

  self = GameObject(I)

  index = 0
  
  self.on 'destroy', ->
    player = engine.first('Player')
    
    unless I.x > engine.camera().I.cameraBounds.width 
      player.I.stars += 1
      player.I.speed += 1
      
      engine.add 'FloatingTextEffect'
        x: I.x - 40
        y: I.y - 40
        text: [
          "Nothings"
          "Gonna"
          "Stop"
          "Me"
          "Now"
        ].wrap(index)
        
        index += 1
        

  return self