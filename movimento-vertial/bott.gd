extends Button
signal touch

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(precionado)


func precionado():
	touch.emit(1)
