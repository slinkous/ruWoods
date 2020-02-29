extends KinematicBody2D

export (int) var speed = 200;

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	velocity.x = Input.get_action_strength("right") - Input.get_action_strength("left")	
	velocity.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	velocity *= speed

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	get_input();
	velocity = move_and_slide(velocity)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
