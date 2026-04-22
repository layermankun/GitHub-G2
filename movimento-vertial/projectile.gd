extends Area2D
class_name projetil
var speed = 400 # Pixels per second
var direction = Vector2.RIGHT 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.projectile_hit.connect(kill_projectile)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		position += direction * speed * delta
func kill_projectile(data):
	data.queue_free()
