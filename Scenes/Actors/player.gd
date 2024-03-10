extends Actor

var jump_count: int = 0
var can_jump: bool = true

const max_jump: int = 500

@onready var sprite_2d = $Sprite2D

func _physics_process(delta):
	apply_gravity(stats.gravity, stats.gravity_force, delta)
	var direction = Input.get_axis("Left","Right")
	var wall_direction = get_wall_normal()
	flip_direction(direction,wall_direction)
	
	if direction:
		velocity.x = move_toward(velocity.x, stats.speed * direction, stats.acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, stats.friction)
	
	if is_on_floor() or is_on_wall_only():
		jump_count = 0
		can_jump = true
	
	if Input.is_action_just_pressed("Jump") and can_jump:
		velocity.y -= clamp(velocity.y, stats.jump, max_jump)
		jump_count += 1
		if jump_count >= 0 and jump_count < 2:
			can_jump = true
		else: can_jump = false
		if is_on_wall_only():
			velocity += stats.wall_jump * stats.wall_speed * wall_direction * delta
	elif Input.is_action_just_released("Jump"):
			velocity.y = 0
	
	move_and_slide()

func flip_direction(direction, wall) -> void:
	if direction < 0:
		sprite_2d.flip_h = true
		if is_on_wall_only():
			sprite_2d.flip_h = false
	elif direction > 0:
		sprite_2d. flip_h = false
		if is_on_wall_only(): 
			sprite_2d.flip_h = true
