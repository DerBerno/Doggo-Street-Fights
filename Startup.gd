extends Node2D


# Declare member variables here. Examples:
# var a = 2
var alpha = 1
var count = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Startup Splash 2").visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	if Input.is_action_pressed("Skip"):
		get_tree().change_scene("res://Menu.tscn")
	if count < 2:
		alpha -= 0.5 * delta
		count += 1 * delta
		get_node("Panel2").color = Color(0, 0, 0, alpha) 
	if count > 2 and count < 4:
		alpha += 0.5 * delta
		count += 1 * delta
		get_node("Panel2").color = Color(0, 0, 0, alpha) 
		
	if count > 4 and count < 6:
		get_node("Startup Splash 1").visible = false
		get_node("Startup Splash 2").visible = true
		alpha -= 0.5 * delta
		count += 1 * delta
		get_node("Panel2").color = Color(0, 0, 0, alpha) 
	if count > 6 and count < 8:
		alpha += 0.5 * delta
		count += 1 * delta
		get_node("Panel2").color = Color(0, 0, 0, alpha) 
	if count > 8 :
		get_node("Startup Splash 2").visible = false
		get_tree().change_scene("res://Menu.tscn")
		
		
		
	pass
	
	
