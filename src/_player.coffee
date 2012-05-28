# HEY LISTEN!
# This file is auto-generated, so editing it directly is a bad idea.
# Modify the entity that generated it instead!
Player = (I={}) ->
  Object.reverseMerge I, {
    "class": "Player",
    "__CODE": "self.include 'Debuggable'\n\nemptyStar = Sprite.loadByName 'empty_star'\nstar = Sprite.loadByName 'star'\n  \nphysics =\n  acceleration:\n    x: 1\n    y: 3\n  jumpPower: -25\n  velocity:\n    xMin: -6\n    xMax: 6\n    yMin: -13\n    yMax: 10\n\nphysics.jumpGravity = physics.acceleration.y * 0.25\n\nphysics.friction = physics.velocity.xMax / (physics.velocity.xMax + physics.acceleration.x)\nphysics.minSpeed = physics.acceleration.x * physics.friction\n\nself.every 1, ->\n  engine.add 'Rainbow'\n    x: I.x + App.width + 50\n    y: rand(200) + 20\n    \nself.every 0.5, ->\n  engine.add 'Star'\n    x: I.x + App.width + 20\n    y: App.height - 32 - 12 - (rand(6) * 32)\n\nself.on 'overlay', (canvas) ->  \n  if I.x > engine.camera().I.cameraBounds.width\n    engine.I.backgroundColor = Color(\"sky blue\").desaturate(.2)  \n  \n    canvas.font('30px Helvetica')\n    canvas.centerText\n      color: 'white'\n      y: 200\n      text: 'Your Score: ' + I.stars\n\n    canvas.font('15px Helvetica')\n    canvas.centerText\n      color: 'white'\n      y: 220\n      text: 'Press space to try again'      \n      \n  I.totalStars.times (n) ->\n    emptyStar.draw(canvas, 30 * n, 5)  \n  \n  I.stars.times (n) ->\n    star.draw(canvas, 30 * n, 5)\n      \nself.on 'update', ->\n  if justPressed.space and (I.x > engine.camera().I.cameraBounds.width)\n    window.load()\n  \n  if I.stars > 10\n    I.freakout = true\n    \n  if I.freakout\n    unless I.x > engine.camera().I.cameraBounds.width\n      engine.I.backgroundColor = Color.random()\n    \n  Collision.collide self, 'Star', (pl, star) ->\n    star.destroy()\n  \n  I.x += I.speed\n  \n  self.playerInput()\n  \n  vel = I.velocity\n  \n  self.applyGravity(vel)\n  self.resolveCollisions(vel)\n\n  I.hflip = I.facing.x < 0 \n    \n  vel.x = vel.x * physics.friction\n      \n  self.clampVelocity(vel)\n  \nself.extend\n  applyGravity: (velocity) ->\n    if I.jumping\n      I.rotation += Math.TAU / 24\n      velocity.y += physics.jumpGravity\n    else\n      I.rotation = 0\n      velocity.y += physics.acceleration.y\n      \n  clampVelocity: (velocity) ->\n    velocity.x = velocity.x.clamp(physics.velocity.xMin, physics.velocity.xMax)\n    velocity.y = velocity.y.clamp(physics.velocity.yMin, physics.velocity.yMax) \n    \n    velocity.x = 0 if velocity.x.abs() < physics.minSpeed\n\n  collide: (xOffset, yOffset, className) ->\n    engine.find(className).inject false, (hit, block) ->\n      hit || Collision.rectangular(self.bounds(xOffset, yOffset), block.bounds())\n\n  jump: ->\n    I.jumping = true\n    I.landed = false\n    I.velocity.y = physics.jumpPower   \n    \n  land: ->\n    I.landed = true\n    \n    Sound.play 'land'\n    \n    engine.add \"DustEmitter\"\n      x: I.x\n      y: I.y + I.height / 2\n      \n  playerInput: ->             \n    if justPressed.z and I.landed    \n      self.jump()\n      \n    I.jumping = false unless keydown.z\n      \n  resolveCollisions: (velocity) ->\n    xSign = velocity.x.sign()\n    ySign = velocity.y.sign()\n    \n    velocity.x.abs().times ->\n      if self.collide(xSign, 0, \".solid\")\n        velocity.x = 0\n      else\n        I.x += xSign\n\n    velocity.y.abs().times ->   \n      if self.collide(0, ySign, \".solid\")                  \n        velocity.y = 0\n        unless I.landed\n          self.land()\n      else\n        I.y += ySign       ",
    "uuid": "player",
    "facing": "Point(1, 0)",
    "jumping": false,
    "landed": true,
    "onWall": false,
    "velocity": "{x: 0, y: 0}",
    "sprite": "balki",
    "totalStars": 30,
    "stars": 0,
    "speed": 5,
    "freakout": false
  }

  self = GameObject(I)

  self.include 'Debuggable'
  
  emptyStar = Sprite.loadByName 'empty_star'
  star = Sprite.loadByName 'star'
    
  physics =
    acceleration:
      x: 1
      y: 3
    jumpPower: -25
    velocity:
      xMin: -6
      xMax: 6
      yMin: -13
      yMax: 10
  
  physics.jumpGravity = physics.acceleration.y * 0.25
  
  physics.friction = physics.velocity.xMax / (physics.velocity.xMax + physics.acceleration.x)
  physics.minSpeed = physics.acceleration.x * physics.friction
  
  self.every 1, ->
    engine.add 'Rainbow'
      x: I.x + App.width + 50
      y: rand(200) + 20
      
  self.every 0.5, ->
    engine.add 'Star'
      x: I.x + App.width + 20
      y: App.height - 32 - 12 - (rand(6) * 32)
  
  self.on 'overlay', (canvas) ->  
    if I.x > engine.camera().I.cameraBounds.width
      engine.I.backgroundColor = Color("sky blue").desaturate(.2)  
    
      canvas.font('30px Helvetica')
      canvas.centerText
        color: 'white'
        y: 200
        text: 'Your Score: ' + I.stars
  
      canvas.font('15px Helvetica')
      canvas.centerText
        color: 'white'
        y: 220
        text: 'Press space to try again'      
        
    I.totalStars.times (n) ->
      emptyStar.draw(canvas, 30 * n, 5)  
    
    I.stars.times (n) ->
      star.draw(canvas, 30 * n, 5)
        
  self.on 'update', ->
    if justPressed.space and (I.x > engine.camera().I.cameraBounds.width)
      window.load()
    
    if I.stars > 10
      I.freakout = true
      
    if I.freakout
      unless I.x > engine.camera().I.cameraBounds.width
        engine.I.backgroundColor = Color.random()
      
    Collision.collide self, 'Star', (pl, star) ->
      star.destroy()
    
    I.x += I.speed
    
    self.playerInput()
    
    vel = I.velocity
    
    self.applyGravity(vel)
    self.resolveCollisions(vel)
  
    I.hflip = I.facing.x < 0 
      
    vel.x = vel.x * physics.friction
        
    self.clampVelocity(vel)
    
  self.extend
    applyGravity: (velocity) ->
      if I.jumping
        I.rotation += Math.TAU / 24
        velocity.y += physics.jumpGravity
      else
        I.rotation = 0
        velocity.y += physics.acceleration.y
        
    clampVelocity: (velocity) ->
      velocity.x = velocity.x.clamp(physics.velocity.xMin, physics.velocity.xMax)
      velocity.y = velocity.y.clamp(physics.velocity.yMin, physics.velocity.yMax) 
      
      velocity.x = 0 if velocity.x.abs() < physics.minSpeed
  
    collide: (xOffset, yOffset, className) ->
      engine.find(className).inject false, (hit, block) ->
        hit || Collision.rectangular(self.bounds(xOffset, yOffset), block.bounds())
  
    jump: ->
      I.jumping = true
      I.landed = false
      I.velocity.y = physics.jumpPower   
      
    land: ->
      I.landed = true
      
      Sound.play 'land'
      
      engine.add "DustEmitter"
        x: I.x
        y: I.y + I.height / 2
        
    playerInput: ->             
      if justPressed.z and I.landed    
        self.jump()
        
      I.jumping = false unless keydown.z
        
    resolveCollisions: (velocity) ->
      xSign = velocity.x.sign()
      ySign = velocity.y.sign()
      
      velocity.x.abs().times ->
        if self.collide(xSign, 0, ".solid")
          velocity.x = 0
        else
          I.x += xSign
  
      velocity.y.abs().times ->   
        if self.collide(0, ySign, ".solid")                  
          velocity.y = 0
          unless I.landed
            self.land()
        else
          I.y += ySign       

  return self