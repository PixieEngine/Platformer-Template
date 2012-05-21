Dust = (I={}, self) ->
  Object.extend I,
    color: 'rgb(100, 100, 100)'
    duration: 0.2
    fadeOut: true
    maxSpeed: 90
    
  I.velocity = [
    Point(-60, -30)
    Point(40, -15)
    Point(-20, -7)
    Point(60, -30)
    Point(40, -15)
    Point(20, -7)
  ].rand()
  
  I.acceleration = Point(0, 60)
         
  return {}