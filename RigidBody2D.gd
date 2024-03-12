extends RigidBody2D

var x
var y
# Called when the node enters the scene tree for the first time.
func _ready():

	x= random_sign()
	y= random_sign()

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	
	apply_central_impulse(Vector2(x*15,y*15))
	pass

func _on_area_2d_body_entered(body):


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


