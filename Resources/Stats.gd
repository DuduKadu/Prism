class_name Actor_Stats
extends Resource

@export_group("Movement")
@export var speed: float = 100
@export var gravity: float = 100
@export var gravity_force: float = 1
@export var acceleration: float = 300
@export var jump: float = 100
@export var wall_jump: float = 300
@export var wall_speed: float = 100
@export var friction: float = 300

@export_group("Character Status")
@export var HitPoints: int
@export var Attack: int
