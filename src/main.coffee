gameKeys
  "Left / Right": "Movement"
  z: "Jump"

window.engine = Engine
  backgroundColor: Color("sky blue").desaturate(.2)
  canvas: $("canvas").pixieCanvas()

100.times (n) ->
  engine.add 'Block'
    x: 32 * n
    y: App.height - 16
  
engine.add 'Player'
  x: 32
  y: App.height - 80
  
engine.start()
    