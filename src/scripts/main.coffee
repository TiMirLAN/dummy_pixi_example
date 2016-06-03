do console.clear
PIXI    = require 'scripts/lib/pixi.js'
console.info PIXI

renderer = PIXI.autoDetectRenderer 800, 600, antialias: on
im = new PIXI.interaction.InteractionManager renderer
document.body.appendChild renderer.view


stage = new PIXI.Container

# text
text = new PIXI.Text 'null'
text.x = 10
text.y = 20
text.style.fill = '#ffffff'

stage.addChild text

# rect
gr = new PIXI.Graphics
stage.addChild gr

sqare_size = 50
getCoords = (mouse)->
  {
    x: mouse.global.x // sqare_size
    y: mouse.global.y // sqare_size
  }

animate = ->
  coords = getCoords im.mouse
  text.text = JSON.stringify coords
  gr.clear()
  gr.lineStyle 2, 0xaa0011, 1
  gr.drawRect(
    coords.x * sqare_size
    coords.y * sqare_size
    sqare_size
    sqare_size
  )
  requestAnimationFrame animate
  renderer.render stage

do animate
