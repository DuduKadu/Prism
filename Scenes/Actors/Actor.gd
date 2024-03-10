class_name Actor
extends CharacterBody2D

@export var stats: Actor_Stats

func apply_gravity(gravity, gravity_force, delta) -> void:
	velocity.y += gravity * gravity_force * delta

func take_damage() -> void:
	pass
