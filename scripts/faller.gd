extends Area2D

var speed = 250
var start_run = false
var direction = Vector2.RIGHT 

func _process(delta: float) -> void:
	if start_run:
		position += direction * speed * delta

func _on_body_entered(body: Node2D):
	# 'jogador' é o class_name que você definiu no script do player
	if body is jogador: 
		start_run = true
		print("O jogador ativou a corrida da área!")
		
