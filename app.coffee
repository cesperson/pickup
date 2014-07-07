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
      PSD.building.states.switch "default"
      PSD.slide2.states.switch "rightScreen"

      # manage sky
      PSD.sky1.superLayer = PSD.building
      PSD.sky1.placeBehind PSD.grayside

      # set up sublayers
      PSD.grayside.y = 1136
      PSD.windows.opacity = 0

      # animate sublayers
      common.changeHue PSD.sky1, 0
      common.fadeIn PSD.windows, 0.5
      common.originalPos PSD.grayside, 0.4

    when 1
      PSD.slide2.states.switchInstant "default"
      PSD.building.states.switch "leftScreen"

      # manage sky
      PSD.sky1.superLayer = PSD.phone
      PSD.sky1.placeBehind PSD.slide2
      PSD.sky1.x = 0

      # animate sublayers
      common.fadeOut(PSD.windows)
      common.moveX(PSD.slide2, 0)

      common.moveX(PSD.sky1, -500)
      common.changeHue(PSD.sky1, 50)

# Set up clicks
PSD.windows.on Events.Click, ->
  switchSlide 1

PSD.slide2.on Events.Click, ->
  switchSlide 0

# Initialize by bringing first slide elements in
switchSlide 0

# Delay example
# utils.delay(1000, switchSlide 0)
