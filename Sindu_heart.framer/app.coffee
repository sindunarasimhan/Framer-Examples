#heart animation library with animation events 
layer = new Layer
	width: 265,height: 218
	scale: 0.4
	curve:"ease-out"
	time:1
	backgroundColor: "transparent"

layer.center()

pop = () -> 
	layer.animate
		properties: 
			scale: 1
			curve:"ease-in"
			time:0.01
			hueRotate:Utils.randomNumber(80,250)
	
	layer.on Events.AnimationEnd,->
		layer.animate
			properties: 
				scale:0.4
				curve:"ease-in"
				time:0.1

layersArr = []

heart = new Layer
	width: 265, height: 218
	image: "images/heart.png"
	
heart.superLayer = layer
layer.addSubLayer(heart)


burst = () ->
	for i in [0..10]
		layers = layer[i] = layer.copy()
		layer[i].scale = Utils.randomNumber(0.2,1)
		
		layer[i].opacity = Utils.randomNumber(0,1)
		layer[i].y = Utils.randomNumber(530,300)
		layer[i].hueRotate = Utils.randomNumber(80,250)
		
		layer[i].animate
			properties:
				y: Utils.randomNumber(-100,-1000)
				opacity: 1
			curve: "ease-in"
	
		layer[i].onAnimationStop ->
			this.destroy()
		
		heartAnimationProps =
			x: Utils.randomNumber(-Screen.width,Screen.width)
			r: Utils.randomNumber(2, 10)
			t: 1.5
			c: "ease-in-out"
		
		floatLeft = new Animation
			layer: layer[i]
			properties:
				x: layer[i].x - heartAnimationProps.x
				rotation: heartAnimationProps.r
			time: heartAnimationProps.t
			curve: heartAnimationProps.c
			
		floatRight = new Animation
			layer: layer[i]
			properties:
				x: layer[i].x + heartAnimationProps.x
				rotation: -heartAnimationProps.r
			time: heartAnimationProps.t
			curve: heartAnimationProps.c
		
		floatLeft.on(Events.AnimationEnd, floatRight.start)
		floatRight.on(Events.AnimationEnd, floatLeft.start)
	
		# Start with a left or right float first
		Utils.randomChoice( [floatLeft, floatRight] ).start()




layer.on Events.Click,->
	pop()
	burst()


