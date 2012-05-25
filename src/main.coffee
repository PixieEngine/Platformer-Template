gameKeys
  "Left / Right": "Movement"
  z: "Jump"

window.engine = Engine
  backgroundColor: Color("sky blue").desaturate(.2)
  canvas: $("canvas").pixieCanvas()
  levels: ['level']
  
engine.include 'Engine.Levels', 'Engine.Tilemap'
  
engine.nextLevel()
engine.start()
    