extends Area2D
class_name cair
var fall = false
var fall_speed= 300
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fall:
		position.y += delta * fall_speed * 1
func _on_body_entered(body: Node2D) -> void:
	if body is jogador:
		queue_free()
	if body is TileMapLayer:
		queue_free()
func _on_area_entered(area: Area2D) -> void:
	if area is activator:
		fall = true
