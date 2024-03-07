extends Actor

func _physics_process(delta):
	apply_gravity(stats.gravity, stats.gravity_force, delta)
	
