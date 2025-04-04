extends Area2D
class_name Bullet

var direction: Vector2

const SPEED = 400

func _ready():
	direction = direction.normalized()

func _physics_process(delta: float) -> void:
	global_position += direction * SPEED * delta

func _on_timer_timeout() -> void:
	queue_free()


#func _on_body_entered(body: Node2D) -> void:
	#if body is Enemy:
		#print("enemy hit")
		#body.queue_free()
		#queue_free()
