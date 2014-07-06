PSD = Framer.Importer.load("imported/pickup")

for key, value of PSD
  # store original frames https://medium.com/framer-js/ca55fc7cfc61
  PSD[key].originalFrame = PSD[key].frame
  # add original State
  PSD[key].states.add
    leftScreen:
      x: -1000
    rightScreen:
      x: 640

# Change default animation
Framer.Defaults.Animation =
  "curve": "ease-out"
  "time": 0.2

# Set up phone outer frame
PSD.phone.properties =
  "width": 640,
  "height": 1136,
  "clip": true

# Set up slide positions
switchSlide = (slideNum) ->
  switch slideNum
    when 0
      console.log(PSD.building.states)
      PSD.building.states.switch "default"
      PSD.slide2.states.switch "rightScreen"

      # set up images
      PSD.grayside.y = 1136
      PSD.sky1.hueRotate = 50
      PSD.windows.opacity = 0

      common.fadeIn PSD.windows, 0.5
      common.originalPos PSD.grayside, 0.4
      common.originalHue PSD.sky1, 0.5
    when 1
      PSD.slide2.states.switchInstant "default"
      PSD.building.states.switch "leftScreen"

      common.fadeOut(PSD.windows)
      common.moveX(PSD.sky1, -300)
      common.moveX(PSD.slide2, 0)
      PSD.sky1.animate
        properties:
          hueRotate: 0

# Set up clicks
PSD.windows.on Events.Click, ->
  switchSlide 1

PSD.slide2.on Events.Click, ->
  switchSlide 0

# Initialize by bringing first slide elements in
switchSlide 0

# Delay example
# utils.delay(1000, switchSlide 0)
