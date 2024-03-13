extends RigidBody2D

var x
var y
var current_stage=0
var breaking_animation:AnimationPlayer
var collision_handled = false

var ballTextures = [
	preload("res://ball1.png"),
	preload("res://ball1.png"),
	preload("res://ball2.png"),
	preload("res://ball3.png"),
	preload("res://ball4.png"),
	preload("res://ball5.png"),
	preload("res://ball6.png"),
	preload("res://ball7.png"),
	preload("res://ball8.png")
]

var currentBallType = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered",Callable( self, "on_body_entered"))
	$Ball1.texture = ballTextures[currentBallType]

	x= random_sign()
	y= random_sign()

	
	#breaking_animation = get_node("character2").get_node("AnimationPlayer")
	## Set up initial sprite
#
	#
	#breaking_animation.play("level_0")

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):


	pass
	
func _physics_process(delta):
	
	apply_central_impulse(Vector2(x*15,y*15))
	pass

func _on_area_2d_body_entered(body):
	if body.name == "RigidBody2D":
		currentBallType += 1
		# Loop back to the first ball type if we reach the end
		if currentBallType >= ballTextures.size():
			queue_free()
			currentBallType = 0
		# Change the sprite texture to the next ball type
		$Ball1.texture = ballTextures[currentBallType]
		#if not collision_handled:
			#collision_handled = true
			#current_stage += 1
			#if current_stage <=7:
				#breaking_animation.animation_set_next("level_"+str(current_stage-1),"level_"+str(current_stage))
			#else:
				#queue_free()


			# Call your function here
		  
			# Reset collision_handled after a short delay
			#collision_handled = false
			
		# Check if this collision has already been handled

			# Handle collision here
	if body.name == "Right":
		x= -0.1 * randi_range(1,5)

	elif body.name == "Left":

		x=0.1* randi_range(1,5)
	elif  body.name == "Down":

		y=-0.1* randi_range(1,5)
	elif body.name == "Up":

		y=0.1* randi_range(1,5)


		


		

func random_sign() -> int:
	var rng = RandomNumberGenerator.new()
	rng.randomize()

	# Generate a random integer between 0 and 1
	var random_integer = rng.randi_range(0, 2)
	var random_number = 1

	# Map the random integer to either 1 or -1
	if random_integer ==0:
		random_number = 1
	else:
		random_number = -1

	return random_number




func _on_body_entered(body):
	pass
	

