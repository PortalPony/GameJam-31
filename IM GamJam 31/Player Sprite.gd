extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $"..".velocity.x < 0:
		self.flip_h = false
		self.play("walk")
	elif $"..".velocity.x > 0:
		self.flip_h = true
		self.play("walk")
	elif $"..".velocity.x == 0:
		self.play("Idle")
