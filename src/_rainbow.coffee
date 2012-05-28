# HEY LISTEN!
# This file is auto-generated, so editing it directly is a bad idea.
# Modify the entity that generated it instead!
Rainbow = (I={}) ->
  Object.reverseMerge I, {
    "class": "Rainbow",
    "parentClass": "GameObject",
    "sprite": "rainbow",
    "__CODE": "self.on 'update', ->\n  I.rotation += Math.TAU / 256",
    "uuid": "rainbow"
  }

  self = GameObject(I)

  self.on 'update', ->
    I.rotation += Math.TAU / 256

  return self