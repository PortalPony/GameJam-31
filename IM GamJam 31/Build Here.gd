extends Node2D



var target

var cost

var create

var build = null

var entered = false




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		$TextureButton.show()
		if Input.is_action_just_pressed("action"):
			if build != null:
				
				if target.inventory.has(cost):
					target.inventory.erase(cost)
					print_debug(target.inventory)
					create = build.instantiate() 
					create.global_position = self.global_position
					add_sibling(create)
					queue_free()
				else:
					print_debug("Miss Item")
	else:
		$TextureButton.hide()

func _on_area_2d_body_entered(body):
	if body.is_in_group("good"):
		target = body
		entered = true # # Replace with function body.


func _on_area_2d_body_exited(body):
	if body.is_in_group("good"):
		entered = false # # Replace with function body.


func _on_texture_button_pressed():
	build = load("res://spear_machine.tscn") # Replace with function body.
	cost = "spear machine"
