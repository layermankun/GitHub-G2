extends Node2D
var num = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.touch.connect(func_x)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func func_x(a):
	num+=a
	print(num)
