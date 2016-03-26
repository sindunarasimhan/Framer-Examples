layer = new Layer
	backgroundColor: "black"
	width: Screen.width, height: Screen.height
	
heartOriginal = new Layer
	width: 170, height: 140
	scale: 0.65
	image: "images/heart.png"

heart =
	blue:   heartOriginal.copy()
	pink:   heartOriginal.copy()
	green:  heartOriginal.copy()
	brown:  heartOriginal.copy()
	violet: heartOriginal.copy()
	orange: heartOriginal.copy()
	yellow: heartOriginal.copy()
	original: heartOriginal

setColor = (heartLayer, hueRotation) ->
	heartLayer.hueRotate  = hueRotation

setColor heart.blue, 275
setColor heart.pink, 500
setColor heart.green, 1500
setColor heart.brown, 500
setColor heart.violet, 350
setColor heart.orange, 2000
setColor heart.yellow, 2200

streamSize = 
	w: Screen.width  * 0.20
	h: Screen.height * 0.66
	backgroundColor:"blue"
	
streamPosition = 
	x: Screen.width  - streamSize.w
	y: Screen.height - streamSize.h
	

