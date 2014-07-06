PSD = Framer.Importer.load("imported/pickup")

# store original frames https://medium.com/framer-js/ca55fc7cfc61
for key, value of PSD
  PSD[key].originalFrame = PSD[key].frame

# Change default animation
Framer.Defaults.Animation =
  "curve": "ease-out"
  "time": 0.2

# Set up phone outer frame
PSD.phone.properties =
  "width": 640,
  "height": 1136,
  "clip": true

# Set up images
PSD.windows.opacity = 0
PSD.grayside.y = 1136
PSD.sky1.hueRotate = 50

# Bring slide 1 elements in
utils.fadeIn PSD.windows, 0.5
utils.originalPos PSD.grayside, 0.4
utils.originalHue PSD.sky1, 0.5

# Set up click
PSD.windows.on Events.Click, ->
  utils.fadeOut(PSD.windows)
  utils.moveX(PSD.sky1, -300)
  utils.moveX(PSD.slide2, 0)
  PSD.sky1.animate
    properties:
      hueRotate: 0
