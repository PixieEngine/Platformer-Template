# HEY LISTEN!
# This file is auto-generated, so editing it directly is a bad idea.
# Modify the entity that generated it instead!
Background = (I={}) ->
  Object.reverseMerge I, {
    "class": "Background",
    "sprite": "background",
    "__CODE": "self.off 'draw'\nself.on 'draw', (canvas) ->\n  I.sprite.fill(canvas, -16, -16, App.width, App.height)",
    "uuid": "background",
    "zIndex": -1
  }

  self = GameObject(I)

  self.off 'draw'
  self.on 'draw', (canvas) ->
    I.sprite.fill(canvas, -16, -16, App.width, App.height)

  return self