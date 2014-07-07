PSD = Framer.Importer.load("imported/pickup")


// store original frames https://medium.com/framer-js/ca55fc7cfc61
for (var layerGroupName in PSD) {
    PSD[layerGroupName].originalFrame = PSD[layerGroupName].frame;
}

// setup phone
PSD.phone.width = 640;
PSD.phone.height = 1136;
PSD.phone.clip = true;

// setup images
PSD.windows.opacity = 0;
PSD.grayside.y = 1136;

PSD.windows.animate({
    properties: {
        opacity: 1
    },
    delay: 1,
    time: 0.2
})

PSD.grayside.animate({
    properties: {
        y: PSD.grayside.originalFrame.y
    },
    time: 0.4
})

PSD.windows.on(Events.Click, function(event, layer) {
    console.log('what');

    PSD.windows.animate({
        properties: {
            opacity: 0
        },
        time: 0.2
    });

    PSD.sky1.animate({
        properties: {
            x: -300
        }
    });

    PSD.grayside.animate({
        properties: {
            y: 1136,
            opacity: 0
        },
        delay: 0.2
    });

    PSD.slide2.animate({
        properties: {
            x: 0
        },
        time: 0.4
    });
})
