extends Node2D
var spawn_points = []
@export var scene_to_spawn: PackedScene = preload("res://cenas/projetil.tscn")

func _ready():
	spawn_points = get_children().filter(func(c): return c is Marker2D)
	
func _on_timer_timeout():
	if scene_to_spawn and spawn_points.size() > 0:
		var point = spawn_points.pick_random()
		var instance = scene_to_spawn.instantiate()
		get_parent().add_child(instance)
		instance.global_position = point.global_position
