// Generated by CoffeeScript 1.7.1
(function() {
  window.common = {
    fadeIn: function(view, delay) {
      return view.animate({
        properties: {
          opacity: 1
        },
        delay: delay
      });
    },
    fadeOut: function(view, delay) {
      return view.animate({
        properties: {
          opacity: 0
        },
        delay: delay
      });
    },
    originalPos: function(view, delay) {
      return view.animate({
        properties: {
          x: view.originalFrame.x,
          y: view.originalFrame.y
        },
        delay: delay
      });
    },
    moveX: function(view, distance, delay) {
      return view.animate({
        properties: {
          x: distance
        },
        delay: delay
      });
    },
    originalHue: function(view, delay) {
      return view.animate({
        properties: {
          hueRotate: 0
        },
        delay: delay
      });
    },
    changeHue: function(view, hueChange, delay) {
      return view.animate({
        properties: {
          hueRotate: hueChange
        },
        delay: delay,
        time: 0.75
      });
    }
  };

}).call(this);
