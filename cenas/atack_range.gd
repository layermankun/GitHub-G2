extends Area2D
class_name atack
var active =  false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation= deg_to_rad(-45)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_area_entered(area: Area2D) -> void:
	if area is projetil:
		if active :
			area.queue_free()
