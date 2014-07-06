window.common =
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
  originalHue: (view, delay) ->
    view.animate
      properties:
        hueRotate: 0
      delay: delay
