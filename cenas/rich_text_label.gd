extends RichTextLabel
var moedas = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.coin.connect(change_text)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func change_text():
	moedas+=1
	text="MOEDAS : "+ str(moedas)
func _process(delta: float) -> void:
	pass
