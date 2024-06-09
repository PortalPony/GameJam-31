extends Node3D

@export var target : RigidBody3D
@onready var enemy = preload("res://Parasite Game/Entities/Enemy.tscn")
var randomNum : int




func _ready():
	
	spawner()

func _process(delta):
	if Input.is_action_just_pressed("Back"):
		spawner()


func spawner():
	
	var instance = enemy.instantiate() 
	
	var offset_position = target.global_position
	
	randomNum = randf_range( -100, 100)
	var random_number = randi_range(0, 1)
	
	if random_number == 0:
		random_number = -1
	
	var alternatespawns = 0
	if alternatespawns == 0:
		alternatespawns = 0
		#offset_position.x += randomNum * random_number
		offset_position.z += 100
	
	#offset_position.x += randomNum
	#offset_position.z +=  100 - randomNum
	#instance.position = offset_position
	#var what = instance.position
	
	
	
	add_child(instance)


func _on_button_pressed():
	print_debug("testpress") # Replace with function body.
