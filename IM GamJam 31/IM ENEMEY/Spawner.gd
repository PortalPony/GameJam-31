extends Node2D

var nowSpawn = true


@onready var enemy = preload("res://IM ENEMEY/enemy_1_0_type.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var instance = enemy.instantiate() 
	
	if nowSpawn == true:
		nowSpawn = false
		$"Spawn Time".start()
		add_child(instance)


func _on_spawn_time_timeout():
	
	nowSpawn = true # Replace with function body.
