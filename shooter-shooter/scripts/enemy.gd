extends CharacterBody2D
class_name Enemy

@onready var death_noise = $Cheer
var player: Player = null

var speed: float = 120.0
var direction := Vector2.ZERO
var stop_distance := 20.0

var hit_points: int = 1

var changedsprite: Texture2D = preload("res://Assets/Happy guy.png")

var sprite: Sprite2D = null

var is_dead: bool = false

func _ready() -> void:
	sprite = $Sprite2D

#func _process(delta: float) -> void:
	#if player != null and not is_dead:
		#look_at(player.global_position)
	
func _physics_process(delta: float) -> void:
	if player != null and not is_dead:
		var enemy_to_player = (player.global_position - global_position)
		if enemy_to_player.length() > stop_distance:
			direction = enemy_to_player.normalized()
		else:
			direction = Vector2.ZERO
			
		if direction !=Vector2.ZERO:
			velocity = speed * direction
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			velocity.y = move_toward(velocity.y, 0, speed)
		move_and_slide()
	
func _on_playerdetect_body_entered(body: Node2D) -> void:
	if body is Player:
		if player == null:
			player = body
			print(name +"found player")
	pass 

func _on_playerdetect_body_exited(body: Node2D) -> void:
	if body is Player:
		if player !=null:
			player = null
			print(name + "lost player")
	pass 
	
func change_sprite(amount: int):
		if amount > 0:
			hit_points -= amount
			if hit_points <= 0:
				sprite.texture = changedsprite
				is_dead = true
				death_noise.play()
				
				var score_label = get_node_or_null("/root/World/CanvasLayer/Label")
				if score_label:
					score_label.add_point()
				
			
		
	
	
	
	
#func _on_enemyhitbox_body_entered(body: Node2D) -> void:
	#if body is Bullet:
		#print("Bullet hit enemy!") 
		#if !is_damaged:
			#sprite.texture = damaged_texture  # Change to the damaged sprite texture
			#is_damaged = true  # Set the flag to indicate that the enemy is damaged  # Change to the damaged sprite texture
		#else:
				#print("Something else collided: " + body.name)  # Debug other collisions
