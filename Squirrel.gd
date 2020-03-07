extends KinematicBody2D

# 1 : idle
# 2 : moving
# 3 : scurry 



enum {
	IDLE, 
	MOVING,
	SCURRY
}

var state = IDLE
var direction : Vector2
var move_timer = 0
var move_timeout = 60
var speed = 50
var dash_direction: Vector2 = direction

var player

func _ready():
	pass # Replace with function body.

func SQUIRREL_IDLE():
	if move_timer >= move_timeout:
		_on_move_timer_timeout()
		move_timer = 0
		_on_move_timer_timeout()
		move_timeout = randi()%210 + 30;
	else:
		move_timer += 1
		
	move_and_slide(direction)

func SQUIRREL_SCURRY():
	#collision_mask = 1
	speed = 150
	#move_timeout = 1000

	move_and_slide(direction)

func _on_move_timer_timeout():
	direction = Vector2(randf() - 0.5, randf() -0.5)*speed
	print(direction)

func _process(delta):
	match state:
		IDLE: 
			SQUIRREL_IDLE()
			pass
		SCURRY:
			SQUIRREL_SCURRY()
			pass
		_:
			pass
						 


func _on_Area2D_body_entered(body):
	player = body
	print(player)
	state = SCURRY
	pass # Replace with function body.
