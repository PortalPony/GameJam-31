extends Node2D




var direction = 1

var attacking = false

var speed = 300

@onready var spear = $Area2D
var entered = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("action"):
			if attacking == false:
				direction = 1
				attacking = true
				$"Machine/attack switch".start()
				$"Machine/attack stop".start()
	
	if attacking == true:
		spear.position.x += delta * speed * direction


func _on_machine_body_entered(body):
	
	if body.is_in_group("good"):
		entered = true # # Replace with function body.


func _on_machine_body_exited(body):
	if body.is_in_group("good"):
		entered = false #  # Replace with function body.


func _on_attack_switch_timeout():
	direction *= -1 # Replace with function body.


func _on_attack_stop_timeout():
	$Area2D.global_position = $".".global_position
	attacking = false # Replace with function body.
