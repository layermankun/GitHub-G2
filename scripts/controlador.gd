extends Node2D
var vidas = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$killwall.hurt.connect(hurt_player)
	SignalBus.player_damage.connect(hurt_player)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func hurt_player(a):
	vidas-=a
	print(vidas)
	$player.booster_counter=1
	if(vidas<0):
		get_tree().change_scene_to_file("res://lose.tscn")
