extends Node2D


var target

var spawnCard = true

var entered = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("action"):
			if spawnCard == true:
				
				
				
				giveCard()
				
				spawnCard = false
				$"Spawn Timer".start()


func _on_area_2d_body_entered(body):
	if body.is_in_group("good"):
		target = body
		entered = true # # Replace with function body.


func _on_area_2d_body_exited(body):
	if body.is_in_group("good"):
		entered = false # # Replace with function body.


func _on_spawn_timer_timeout():
	spawnCard = true # Replace with function body.


func giveCard():
	target.inventory += ["spear machine"]
	print_debug(target.inventory)



