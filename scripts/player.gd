extends CharacterBody2D
class_name jogador
@onready var animated : AnimatedSprite2D = $AnimatedSprite2D
var velocidade_baixa = 150
var velocidade_media = 250
var velocidade_alta =  500
var velocidade_hurt = 1000
var base_speed = 1
const JUMP_VELOCITY = -600.0
var booster_counter = 0
@warning_ignore("shadowed_global_identifier")
var atack =  false

func _ready() -> void:
	pass
func _physics_process(delta: float) -> void:
	if booster_counter == 1 :
		base_speed = base_speed * 10
	if booster_counter>=1:
		booster_counter+=1
		base_speed-=0.2
		if base_speed<=1:
			base_speed = 1
			booster_counter = 0
			
	if not is_on_floor(): # Add the gravity.
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("counter"):
		atack = true
	if atack:
		animated.play("atack")
	if atack == false:
		if Input.is_action_just_pressed("ui_accept") and is_on_floor(): # Handle jump.
			velocity.y = JUMP_VELOCITY
			animated.play("jump")
		if velocity.y > 0 :
			animated.play("fall")
		if velocity.y == 0 :
			animated.play("run")

	var aceleration = Input.get_axis("ui_left", "ui_right")
	if aceleration > 0 : 
		velocity.x = base_speed * velocidade_alta
	elif aceleration < 0 : 
		velocity.x = base_speed * velocidade_baixa
	else :
		velocity.x = base_speed * velocidade_media
		
	if Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left"):
		velocity.x = base_speed * velocidade_media

	move_and_slide()


func _on_animated_sprite_2d_frame_changed() -> void:
	if $AnimatedSprite2D.animation == "atack":
		$atack_range.rotation+= deg_to_rad(45)
		$atack_range.active = true
func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "atack":
		atack = false
