extends Node2D

var entered = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("action"):
			pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("good"):
		entered = true # # Replace with function body.


func _on_area_2d_body_exited(body):
	if body.is_in_group("good"):
		entered = false # # Replace with function body.
