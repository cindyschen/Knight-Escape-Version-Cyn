extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const MAX_JUMPS = 2
var jumps = 0
var dead = false
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
@onready var hit_sound: AudioStreamPlayer2D = $HitSound
@onready var pause_menu: CanvasLayer = $"../PauseMenu"

func die() -> void:
	if dead:
		return

	dead = true
	hit_sound.play()
	animated_sprite.play("hit")

	await animated_sprite.animation_finished

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and not dead:
		if is_on_floor():
			jumps = 0
			jump_sound.play()
			velocity.y = JUMP_VELOCITY
			jumps += 1
			print(jumps)
		else:
			if jumps < MAX_JUMPS:
				jump_sound.play()
				velocity.y = JUMP_VELOCITY
				jumps += 1
				print(jumps)
			

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if not dead:
		if direction == 1:
			animated_sprite.flip_h = false
		if direction == -1:
			animated_sprite.flip_h = true
	
	# Play animations
	if not dead:
		if is_on_floor():
			jumps = 1
			if direction == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")
		else:
			animated_sprite.play("jump")

	if not dead:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
