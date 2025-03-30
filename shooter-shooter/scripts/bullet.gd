extends Area2D

var direction: Vector2

const SPEED = 400

func _ready():
	direction = direction.normalized()

func _physics_process(delta: float) -> void:
	global_position += direction * SPEED * delta
