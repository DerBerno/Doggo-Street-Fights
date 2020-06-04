extends KinematicBody2D

var movementSpeed = 0.5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	if Input.is_action_pressed("move down"):
		self.move_and_collide(Vector2(0,movementSpeed))
		$AnimatedSprite.animation = "Downwards"
		$CollisionShape2D.scale.x = 0.3
		$AnimatedSprite.playing = true
		
	elif Input.is_action_pressed("move left"):
		self.move_and_collide(Vector2(-movementSpeed,0))
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.animation = "Sideways"
		$CollisionShape2D.scale.x = 0.6
		$AnimatedSprite.playing = true
		
	elif Input.is_action_pressed("move up"):
		self.move_and_collide(Vector2(0,-movementSpeed))
		$AnimatedSprite.animation = "Upwards"
		$CollisionShape2D.scale.x = 0.3
		$AnimatedSprite.playing = true
		
	elif Input.is_action_pressed("move right"):
		self.move_and_collide(Vector2(movementSpeed,0))
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.animation = "Sideways"
		$CollisionShape2D.scale.x = 0.6
		$AnimatedSprite.playing = true
	else:
		$AnimatedSprite.playing = false
