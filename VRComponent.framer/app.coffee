elevationLabel = new Layer
	backgroundColor: "transparent"

elevationValue = new Layer
	backgroundColor: "transparent"
	y:30

elevationLabel.html ="ELEVATION"
elevationValue.html ="0"


tiltLabel = new Layer
	backgroundColor: "transparent"
	x:260

tiltValue = new Layer
	x:262
	backgroundColor: "transparent"
	y:30

tiltValue.html ="0"

tiltLabel.html ="TILT"

headingLabel = new Layer
	backgroundColor: "transparent"
	x:470

headingLabel.html ="HEADING"

headingValue = new Layer
	backgroundColor: "transparent"
	x:470
	y:30

headingValue.html ="0"
	


{VRComponent, VRLayer} = require "VRComponent"




vr = new VRComponent

layer = new VRLayer
    heading: 230
    elevation: 10
 
vr.projectLayer(layer)
vr.lookAtLatestProjectedLayer = true

animateLayer  = () ->
	layer.animate
		properties:
			heading:-30
			elevation:5

heading = vr.heading
 
# continues updates 
vr.on Events.OrientationDidChange, (data) ->
   animateLayer()
   elevationValue.html = Math.round(data.elevation)
   tiltValue.html = Math.round(data.tilt)
   headingValue.html = Math.round(data.heading)