extends CharacterBody2D
class_name jogador
signal kill
const velocidade_baixa = 150
const velocidade_media = 250
const velocidade_alta =  500
const base_speed = 1
const JUMP_VELOCITY = -600.0
var movimento_normal = true
var input_window_frames = 10
var current_frames = 0
var window_active = false
var counter_up = false
var white_end = 15
var white_time = 0
var proj = 0
var fail_counter = 0
var booster_windown = 10
var booster_counter = 0

func _ready() -> void:
	pass
	
func janela_input(area):
	window_active = true
	current_frames = 0
	proj = area
	
func _physics_process(delta: float) -> void:
	
	if counter_up == true: # Flash branco no jogador
		white_time += 1
		$Sprite2D.modulate = Color(10, 10, 10) # Branco intenso (Glow) 
		
		if white_time >= white_end: # Corrigido: espera chegar em 15 frames
			counter_up = false
			white_time = 0 # Reseta para o próximo counter
	else:
		$Sprite2D.modulate = Color(1, 1, 1) # Retorna ao normal [cite: 1, 2]
	
	if window_active == true: #janela para parry
		current_frames += 1
		if current_frames > input_window_frames:
			window_active = false
		if Input.is_action_just_pressed("counter"):
			counter(proj)
			window_active = false
		else : 
			fail_counter +=1
			if fail_counter == input_window_frames:
				fail_counter=0
				player_hurt()
			
	if not is_on_floor(): # Add the gravity.
		velocity += get_gravity() * delta

	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor(): # Handle jump.
		velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed("ui_left"):
		velocity.x = base_speed * velocidade_baixa
		movimento_normal = false
	if Input.is_action_just_released("ui_left"):
		movimento_normal = true
	if Input.is_action_pressed("ui_right"):
		velocity.x = base_speed * velocidade_alta
		movimento_normal = false
	if Input.is_action_just_released("ui_right"):
		movimento_normal= true
	if movimento_normal == true :
		velocity.x = base_speed * velocidade_media
	move_and_slide()
	
		
func counter(data):
	SignalBus.projectile_hit.emit(data)
	counter_up = true
func player_hurt():
	print("me machuquei")
	SignalBus.player_damage.emit(1)


func _on_area_2d_area_entered(area: Area2D) -> void:
		if area is projetil:
			print("Fui atingido!")
			janela_input(area)
