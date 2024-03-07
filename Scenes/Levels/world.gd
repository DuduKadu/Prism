extends Node2D

@onready var polygon_2d = $StaticBody2D/CollisionPolygon2D/Polygon2D
@onready var collision_polygon_2d = $StaticBody2D/CollisionPolygon2D
@onready var collision_polygon_2d2 = $StaticBody2D2/CollisionPolygon2D
@onready var polygon_2d2 = $StaticBody2D2/CollisionPolygon2D/Polygon2D

func _ready():
	polygon_2d.polygon = collision_polygon_2d.polygon 
	polygon_2d2.polygon = collision_polygon_2d2.polygon 
