extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Errors = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	reload_values()


func reload_values():
	$CenterContainer/ScrollContainer/Variables/Attacks/LineEdit.text = str(Global.read_savegame("Attacks"))
	$"CenterContainer/ScrollContainer/Variables/Lab Points/LineEdit".text = str(Global.read_savegame("LabPoints"))
	$CenterContainer/ScrollContainer/Variables/Rank/LineEdit.text = str(Global.read_savegame("Rank"))
	$CenterContainer/ScrollContainer/Variables/Strength/LineEdit.text = str(Global.read_savegame("Strength"))
	$CenterContainer/ScrollContainer/Variables/Upgraded/LineEdit.text = str(Global.read_savegame("Upgraded"))
	$CenterContainer/ScrollContainer/Variables/Volume1/LineEdit.text = str(Global.read_savegame("Vol1"))
	$CenterContainer/ScrollContainer/Variables/Volume2/LineEdit.text = str(Global.read_savegame("Vol2"))


func _on_Reset_pressed():
	Global.delete() #Call the Savedata reset function
	reload_values() #reloads the values


func _on_Quit_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menu.tscn")


func _on_Save_pressed():
	Errors = 0
	if $"CenterContainer/ScrollContainer/Variables/Lab Points/LineEdit".text != null: 
			if $"CenterContainer/ScrollContainer/Variables/Lab Points/LineEdit".text.is_valid_integer():
				Global.save("LabPoints", int($"CenterContainer/ScrollContainer/Variables/Lab Points/LineEdit".text)) #Save User Entry
			else:
				
				Errors += 1
	
	
	if $"CenterContainer/ScrollContainer/Variables/Attacks/LineEdit".text != null: 
			if $"CenterContainer/ScrollContainer/Variables/Attacks/LineEdit".text.is_valid_integer():
				Global.save("Attacks", int($"CenterContainer/ScrollContainer/Variables/Attacks/LineEdit".text)) #Save User Entry
			else:
				
				Errors += 1
	
	
	if $"CenterContainer/ScrollContainer/Variables/Rank/LineEdit".text != null: 
			if $"CenterContainer/ScrollContainer/Variables/Rank/LineEdit".text.is_valid_integer():
				Global.save("Rank", int($"CenterContainer/ScrollContainer/Variables/Rank/LineEdit".text)) #Save User Entry
			else:
				
				Errors += 1
	
	
	if $"CenterContainer/ScrollContainer/Variables/Strength/LineEdit".text != null: 
		if $"CenterContainer/ScrollContainer/Variables/Strength/LineEdit".text.is_valid_integer():
			Global.save("Strength", int($"CenterContainer/ScrollContainer/Variables/Strength/LineEdit".text)) #Save User Entry
		else:
			
			Errors += 1
	
	
	if $"CenterContainer/ScrollContainer/Variables/Upgraded/LineEdit".text != null: 
		if $"CenterContainer/ScrollContainer/Variables/Upgraded/LineEdit".text.is_valid_integer():
			Global.save("Upgraded", int($"CenterContainer/ScrollContainer/Variables/Upgraded/LineEdit".text)) #Save User Entry
		else:
			Errors += 1
	
	
	if $"CenterContainer/ScrollContainer/Variables/Volume1/LineEdit".text != null: 
		if $"CenterContainer/ScrollContainer/Variables/Volume1/LineEdit".text.is_valid_integer():
			Global.save("Vol1", int($"CenterContainer/ScrollContainer/Variables/Volume1/LineEdit".text)) #Save User Entry
		else:
			Errors += 1
	
	
	if $"CenterContainer/ScrollContainer/Variables/Volume2/LineEdit".text != null: 
		if $"CenterContainer/ScrollContainer/Variables/Volume2/LineEdit".text.is_valid_integer():
			Global.save("Vol2", int($"CenterContainer/ScrollContainer/Variables/Volume2/LineEdit".text)) #Save User Entry
		else:
			Errors += 1
	
	if Errors == 0:
		$PopupSuccess/ConfirmationDialog.dialog_text = "Savedata saved at:" + Global.save_path 
	else:
		$PopupSuccess/ConfirmationDialog.dialog_text = "Savedata saved at:" + Global.save_path + "\n" + str(Errors) +"value(s) is/are invalid and have not been saved"
	$PopupSuccess/ConfirmationDialog.popup_centered()



func delete(Value):
	Global.save(Value,Global.defaults[Value])
	reload_values()
