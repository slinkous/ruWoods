extends KinematicBody2D

export (int) var speed = 64;

var velocity = Vector2.ZERO

onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func get_input():
	velocity = Vector2.ZERO
	velocity.x = Input.get_action_strength("right") - Input.get_action_strength("left")	
	velocity.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	if velocity != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", velocity.normalized())
		animationTree.set("parameters/Walk/blend_position", velocity.normalized())
		animationState.travel("Walk")
	else: 
		animationState.travel("Idle")
		
	if Input.is_action_pressed("sneak"):
		velocity *= 0.5
		
	velocity *= speed

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	get_input();
	velocity = move_and_slide(velocity)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
