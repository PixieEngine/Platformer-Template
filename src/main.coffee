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
 src: "http://www.youtube.com/watch?v=moyHT-OP5ec?wmode=transparent&autoplay=1&controls=0&loop=1"
 frameborder: "0"