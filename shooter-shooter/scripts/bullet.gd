extends Area2D
class_name Bullet

@export var bullet_sprites: Array = [ preload("res://Assets/note 1.png"),
									  preload("res://Assets/note2.png"),
									  preload("res://Assets/note3.png")]
					


var explosion_scene = preload("res://Scenes/Explosion.tscn")

var direction: Vector2

const SPEED = 400

var sprite: Sprite2D

func _ready():
	direction = direction.normalized()
	sprite = $Sprite2D
	var random_index = randi() % bullet_sprites.size()
	sprite.texture = bullet_sprites[random_index]

func _physics_process(delta: float) -> void:
	global_position += direction * SPEED * delta
	
func _on_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		if body.is_dead:
			return
		body.change_sprite(1)
		print("enemy hit")
		#body.queue_free()
		
		
		var explosion = explosion_scene.instantiate()
		explosion.global_position = global_position
		explosion.emitting = true
		get_parent().add_child(explosion)
		
		queue_free()
		
		
