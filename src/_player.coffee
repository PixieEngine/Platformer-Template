# HEY LISTEN!
# This file is auto-generated, so editing it directly is a bad idea.
# Modify the entity that generated it instead!
Player = (I={}) ->
  Object.reverseMerge I, {
    "class": "Player",
    "__CODE": "self.include 'Debuggable'\n\nemptyStar = Sprite.loadByName 'empty_star'\nstar = Sprite.loadByName 'star'\n\nself.debug\n  filter: 'changed'\n  bounds: false\n  velocity: 0\n  x: 35\n  y: 35\n  \nphysics =\n  acceleration:\n    x: 1\n    y: 3\n  jumpPower: -20\n  velocity:\n    xMin: -6\n    xMax: 6\n    yMin: -13\n    yMax: 10\n\nphysics.jumpGravity = physics.acceleration.y * 0.3\n\nphysics.friction = physics.velocity.xMax / (physics.velocity.xMax + physics.acceleration.x)\nphysics.minSpeed = physics.acceleration.x * physics.friction\n\nself.every 1, ->\n  engine.add 'Rainbow'\n    x: I.x + 40\n    y: rand(200) + 20\n    \nself.every 0.5, ->\n  engine.add 'Star'\n    x: I.x + 600\n    y: App.height - 32 - 12\n\nself.on 'overlay', (canvas) ->\n  I.stars.times (n) ->\n    star.draw(canvas, 30 * n, 20)\n  \n  (I.totalStars - I.stars).times (n) ->\n    emptyStar.draw(canvas, 30 * n, 20)\n    \nself.on 'update', ->\n  Collision.collide self, 'Star', (pl, star) ->\n    star.destroy()\n  \n  I.x += 5\n  \n  self.playerInput()\n  \n  vel = I.velocity\n  \n  self.applyGravity(vel)\n  self.resolveCollisions(vel)\n\n  I.hflip = I.facing.x < 0 \n    \n  vel.x = vel.x * physics.friction\n      \n  self.clampVelocity(vel)\n  \nself.extend\n  applyGravity: (velocity) ->\n    if I.jumping\n      velocity.y += physics.jumpGravity\n    else\n      velocity.y += physics.acceleration.y\n      \n  clampVelocity: (velocity) ->\n    velocity.x = velocity.x.clamp(physics.velocity.xMin, physics.velocity.xMax)\n    velocity.y = velocity.y.clamp(physics.velocity.yMin, physics.velocity.yMax) \n    \n    velocity.x = 0 if velocity.x.abs() < physics.minSpeed\n\n  collide: (xOffset, yOffset, className) ->\n    engine.find(className).inject false, (hit, block) ->\n      hit || Collision.rectangular(self.bounds(xOffset, yOffset), block.bounds())\n\n  jump: ->\n    I.jumping = true\n    I.landed = false\n    I.velocity.y = physics.jumpPower   \n    \n  land: ->\n    I.landed = true\n    \n    Sound.play 'land'\n    \n    engine.add \"DustEmitter\"\n      x: I.x\n      y: I.y + I.height / 2\n      \n  playerInput: ->  \n    if keydown.right\n      I.velocity.x += physics.acceleration.x\n     \n      I.facing = Point(1, 0)\n      \n    if justPressed.z and I.landed    \n      self.jump()\n      \n    I.jumping = false unless keydown.z\n      \n  resolveCollisions: (velocity) ->\n    xSign = velocity.x.sign()\n    ySign = velocity.y.sign()\n    \n    velocity.x.abs().times ->\n      if self.collide(xSign, 0, \".solid\")\n        velocity.x = 0\n      else\n        I.x += xSign\n\n    velocity.y.abs().times ->   \n      if self.collide(0, ySign, \".solid\")                  \n        velocity.y = 0\n        unless I.landed\n          self.land()\n      else\n        I.y += ySign       ",
    "uuid": "player",
    "facing": "Point(1, 0)",
    "jumping": false,
    "landed": true,
    "onWall": false,
    "velocity": "{x: 0, y: 0}",
    "sprite": "balki",
    "totalStars": 30,
    "stars": 0
  }

  self = GameObject(I)

  self.include 'Debuggable'
  
  emptyStar = Sprite.loadByName 'empty_star'
  star = Sprite.loadByName 'star'
  
  self.debug
    filter: 'changed'
    bounds: false
    velocity: 0
    x: 35
    y: 35
    
  physics =
    acceleration:
      x: 1
      y: 3
    jumpPower: -20
    velocity:
      xMin: -6
      xMax: 6
      yMin: -13
      yMax: 10
  
  physics.jumpGravity = physics.acceleration.y * 0.3
  
  physics.friction = physics.velocity.xMax / (physics.velocity.xMax + physics.acceleration.x)
  physics.minSpeed = physics.acceleration.x * physics.friction
  
  self.every 1, ->
    engine.add 'Rainbow'
      x: I.x + 40
      y: rand(200) + 20
      
  self.every 0.5, ->
    engine.add 'Star'
      x: I.x + 600
      y: App.height - 32 - 12
  
  self.on 'overlay', (canvas) ->
    I.stars.times (n) ->
      star.draw(canvas, 30 * n, 20)
    
    (I.totalStars - I.stars).times (n) ->
      emptyStar.draw(canvas, 30 * n, 20)
      
  self.on 'update', ->
    Collision.collide self, 'Star', (pl, star) ->
      star.destroy()
    
    I.x += 5
    
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
        velocity.y += physics.jumpGravity
      else
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
      if keydown.right
        I.velocity.x += physics.acceleration.x
       
        I.facing = Point(1, 0)
        
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