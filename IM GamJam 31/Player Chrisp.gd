extends CharacterBody2D

var inventory : Array = ["wood","wood","iron"]



var on_ladder = false

const SPEED = 300.0
const JUMP_VELOCITY = -1000.0


var hp = 100

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() and !on_ladder:
		velocity.y += gravity * delta
	
	if on_ladder:
		if Input.is_action_pressed("up"):
			velocity.y = -SPEED * delta * 100
		elif Input.is_action_pressed("down"):
			velocity.y = SPEED * delta * 100
		else:
			velocity.y = 0
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_ladder_body_entered(body):
	if body.is_in_group("good"):
		on_ladder = true #   # Replace with function body.


func _on_ladder_body_exited(body):
	if body.is_in_group("good"):
		on_ladder = false #  # Replace with function body.
