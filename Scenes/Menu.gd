extends Node2D

var mainScene = load("res://Scenes/RusWoods.tscn")

func get_input():
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene_to(mainScene)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_input();
