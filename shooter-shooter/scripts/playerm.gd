extends CharacterBody2D
class_name Player

signal died

@onready var camera_remote_transform = $cameraremotetransform

var speed = 300

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

func _physics_process(delta: float) -> void:
	var move_dir = Vector2(Input.get_axis("move_left","move_right"),
	Input.get_axis("move_up","move_down"))
	if move_dir !=Vector2.ZERO:
		velocity = speed * move_dir.normalized()
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
		
	move_and_slide()

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Enemy:
		died.emit()
		queue_free()
