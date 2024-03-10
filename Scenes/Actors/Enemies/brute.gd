extends Actor

var direction = 1
@onready var ledge_detection_r = $LedgeDetectionR
@onready var ledge_detection_l = $LedgeDetectionL

func _physics_process(delta):
	apply_gravity(stats.gravity, stats.gravity_force, delta)
	
	if not ledge_detection_r.is_colliding():
		velocity.x = 0 
		direction = -1
	elif not ledge_detection_l.is_colliding():
		velocity.x = 0
		direction = 1
	
	velocity.x = move_toward(velocity.x, stats.speed * direction, stats.acceleration * delta)
	
	move_and_slide()
