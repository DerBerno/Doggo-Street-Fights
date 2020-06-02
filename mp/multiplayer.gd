extends Node2D


# Declare member variables here. Examples:
# var a = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	var server = NetworkedMultiplayerENet.new()
	server.create_client(str(get_node("IP").text), int(get_node("Port").text))
	get_tree().set_network_peer(server)
	rpc("function_name", 1)
func _on_connection_failed(error):
	print(error)
func _on_connected():
	print("nice")
	
	pass # Replace with function body.
