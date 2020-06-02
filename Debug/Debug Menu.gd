extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	reload_values()


func reload_values():
	$CenterContainer/ScrollContainer/Variables/Attacks/LineEdit.text = str(Global.read_savegame("Attacks"))


func _on_Reset_pressed():
	Global.delete() #Call the Savedata reset function
	reload_values() #reloads the values


func _on_Quit_pressed():
	get_tree().change_scene("res://Menu.tscn")


func _on_Save_pressed():
	if $"CenterContainer/ScrollContainer/Variables/Lab Points/Label".text != null: 
			if $"CenterContainer/ScrollContainer/Variables/Lab Points/Label".text.is_valid_integer():
				Global.save("LabPoints", int($"CenterContainer/ScrollContainer/Variables/Lab Points/Label".text))
			else:
				$Popup/ConfirmationDialog.popup_centered()
