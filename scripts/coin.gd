extends Area2D
class_name coletavel
var speed = 400 # Pixels per second
var direction = Vector2.RIGHT 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta: float) -> void:
		pass


func _on_body_entered(body: Node2D) -> void:
	if body is jogador:
		SignalBus.coin.emit()
		queue_free()
