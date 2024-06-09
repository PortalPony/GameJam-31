extends CharacterBody2D

var hp = 100


@onready var nav = $Nav

var speed = 300
var accel = 7


var direction
var distance
var closest_node
var closest_distance = INF
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hp <= 0:
		queue_free()
	
	for i in get_tree().get_nodes_in_group("good"):
		distance = global_position.distance_to(i.global_position)
		if distance < closest_distance:
			
			closest_distance = distance
			closest_node = i
	
	if closest_node != null:
		if closest_node.global_position.x >= self.global_position.x:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		nav.target_position = closest_node.global_position
		
		direction = nav.get_next_path_position() - global_position
		direction = direction.normalized()
		
		velocity = velocity.lerp(direction * speed, accel * delta)
		
		move_and_slide()
	elif closest_node == null:
		closest_distance = INF
