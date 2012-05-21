Expirable = (I={}, self) ->
  Object.reverseMerge I,
    duration: -1
    alpha: 1
    fadeOut: false

  startingAlpha = I.alpha

  self.bind "update", (dt) ->
    if I.fadeOut
      I.alpha = startingAlpha * (1 - (I.age / I.duration))

    if I.duration != -1 && I.age >= I.duration
      I.active = false
      
    I.alpha = I.alpha.clamp(0, 1)

  return {}
