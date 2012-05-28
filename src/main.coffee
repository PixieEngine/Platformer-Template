gameKeys
  "Left / Right": "Movement"
  z: "Jump"

window.engine = Engine
  clear: true
  canvas: $("canvas").pixieCanvas()

window.textIndex = 0  
  
window.reloadGame = ->   
  320.times (n) ->
    engine.add 'Block'
      x: 32 * n
      y: App.height - 16
    
  player = engine.add 'Player'
    x: 32
    y: App.height - 80
    
  player.I.stars = 0
  
window.reloadGame()
  
engine.start()
    
engine.on 'update', ->
  camera = engine.camera()
  bounds = Rectangle
    x: 0
    y: 0
    width: 10000
    height: App.height
  
  target = engine.first("Player")
  
  if target 
    camera.follow(target, "topdown")
    camera.I.cameraBounds = bounds
    camera.I.t90 = 0.5
    camera.I.x = target.I.x
    camera.I.y = target.I.y
      
$('body').append $ '<iframe />',
 class: "youtube-player"
 css:
   position: "fixed"
   top: 0
   left: 0
   zIndex: -1
 type: "text/html"
 width: App.width
 height: App.height
 src: "http://www.youtube.com/embed/moyHT-OP5ec?wmode=transparent&autoplay=1&controls=0&loop=1"
 frameborder: "0"