gameKeys
  "Left / Right": "Movement"
  z: "Jump"

window.engine = Engine
  backgroundColor: Color("sky blue").desaturate(.2)
  canvas: $("canvas").pixieCanvas()
  includedModules: ["Levels", "Tilemap"]
  levels: ['level']
  
engine.nextLevel()
engine.start()

engine.bind 'update', ->
  if keydown.f
    engine.flash()
    