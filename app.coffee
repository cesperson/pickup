PSD = Framer.Importer.load("imported/pickup")

# store original frames https://medium.com/framer-js/ca55fc7cfc61
for key, value of PSD
  PSD[key].originalFrame = PSD[key].frame

# Change default animation
Framer.Defaults.Animation =
  "curve": "ease-out"
  "time": 0.2

utils =
  fadeIn: (view, delay) ->
    view.animate
      properties:
        opacity: 1
      delay: delay
  fadeOut: (view, delay) ->
    view.animate
      properties:
        opacity: 0
      delay: delay
  originalPos: (view, delay) ->
    view.animate
      properties:
        x: view.originalFrame.x
        y: view.originalFrame.y
      delay: delay
  moveX: (view, distance, delay) ->
    view.animate
      properties:
        x: distance
      delay: delay

# Set up phone outer frame
PSD.phone.properties =
  "width": 640,
  "height": 1136,
  "clip": true

# Set up images
PSD.windows.opacity = 0
PSD.grayside.y = 1136

utils.fadeIn PSD.windows, 0.5
utils.originalPos PSD.grayside, 0.4

PSD.windows.on Events.Click, ->
  utils.fadeOut(PSD.windows)
  utils.moveX(PSD.sky1, -300)
  PSD.grayside.animate
    properties:
      scale: 2
  utils.moveX(PSD.slide2, 0, 0.25)

#layerA = new Layer
#  width:100, height: 100, backgroundColor:"#17a5ff", y:30, x: 30,
#  borderRadius: "8px"

