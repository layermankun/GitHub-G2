extends Area2D

var speed = 250 # Pixels per second
var direction = Vector2.RIGHT 
signal hurt
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hurt.connect(hurted)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta
	
func hurted():
	hurt.emit(1)

func _on_body_entered(body: Node2D) -> void:
	
	if body is jogador:
		hurted()
		#get_tree().change_scene_to_file("res://lose.tscn")
	
