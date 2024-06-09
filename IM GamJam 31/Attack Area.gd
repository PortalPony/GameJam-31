extends Area2D


var started = false

var target = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if target:
		if started == false:
			started = true
			$"attack  speed".start()


func _on_body_entered(body):
	
	if body.is_in_group("good"):
		if target == null:
			target = body
		print_debug(body.hp) # Replace with function body.


func _on_body_exited(body):
	if body == target:
		target = null # Replace with function body.


func _on_attack__speed_timeout():
	started = false
	if target != null:
		target.hp -= 10

