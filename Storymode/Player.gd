extends KinematicBody2D

var movementSpeed = 0.5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_pressed("move down"):
		self.move_and_collide(Vector2(0,movementSpeed))
		
	if Input.is_action_pressed("move left"):
		self.move_and_collide(Vector2(-movementSpeed,0))
		$AnimatedSprite.flip_h = true
		
	if Input.is_action_pressed("move up"):
		self.move_and_collide(Vector2(0,-movementSpeed))
		
	if Input.is_action_pressed("move right"):
		self.move_and_collide(Vector2(movementSpeed,0))
		$AnimatedSprite.flip_h = false
