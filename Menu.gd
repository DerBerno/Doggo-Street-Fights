extends Node2D


# Declare member variables here. Examples:
# var a = 2
var LookForEnemy = false
var LookForEnemyCount = 0
var randomized = 1
var ResetCount = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	Global.refresh()
	if OS.get_name() == "HTML5":
		get_node("EXIT").visible = false
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	get_node("HSlider").value = Global.read_savegame("Vol1")
	get_node("HSlider2").value = Global.read_savegame("Vol2")
	get_node("HP").text = "Health: " + str(15 * Global.Strength)
	get_node("Power").text = "Power: " + str(Global.Strength)
	get_node("Energy").text = "Energy: " + str(12 * Global.Strength)
	
	get_node("sleepuwu").play("default")
	get_node("Rank").text = str(Global.Rank)


	
	if Global.Rank < 100:
		get_node("Rank/RankName").text = "Bronce III"
		get_node("Rank2").play("Bronze")
	if Global.Rank < 200 and Global.Rank > 99:
		get_node("Rank2").play("Bronze")
		get_node("Rank/RankName").text = "Bronce II"
	if Global.Rank < 300 and Global.Rank > 199:
		get_node("Rank2").play("Bronze")
		get_node("Rank/RankName").text = "Bronce I"
	if Global.Rank < 450 and Global.Rank > 299:
		get_node("Rank2").play("Silver")
		get_node("Rank/RankName").text = "Silver III"
	if Global.Rank < 600 and Global.Rank > 449:
		get_node("Rank2").play("Silver")
		get_node("Rank/RankName").text = "Silver II"
	if Global.Rank < 750 and Global.Rank > 599:
		get_node("Rank2").play("Silver")
		get_node("Rank/RankName").text = "Silver I"
	if Global.Rank < 900 and Global.Rank > 749:

		get_node("Rank2").play("Gold")
		get_node("Rank/RankName").text = "Gold III"
	if Global.Rank < 1150 and Global.Rank > 899:
		get_node("Rank2").play("Gold")
		
		get_node("Rank/RankName").text = "Gold II"
	if Global.Rank < 1400 and Global.Rank > 1149:
		get_node("Rank2").play("Gold")
		
		get_node("Rank/RankName").text = "Gold I"
	if Global.Rank < 1700 and Global.Rank > 1399:
		get_node("Rank2").play("Diamond")
		
		get_node("Rank/RankName").text = "Diamond III"
	if Global.Rank < 2000 and Global.Rank > 1699:
		get_node("Rank2").play("Diamond")
		
		get_node("Rank/RankName").text = "Diamond II"
	if Global.Rank < 2500 and Global.Rank > 1999:
		get_node("Rank2").play("Diamond")
		
		get_node("Rank/RankName").text = "Diamond I"
	if Global.Rank < 3000 and Global.Rank > 2499:
		get_node("Rank2").play("Legend")
		
		get_node("Rank/RankName").text = "Legend III"
	if Global.Rank < 4000 and Global.Rank > 2999:
		get_node("Rank2").play("Legend")
		
		
		get_node("Rank/RankName").text = "Legend II"
	if Global.Rank > 3999:
		get_node("Rank/RankName").text = "Legend"
		get_node("Rank2").play("Legend")
	if Global.Rank > 19999:
		get_node("Rank/RankName").text = "Challenger"
		get_node("Rank2").play("Challenger")
		
		
	get_node("Label").text = "Cost: " + str(50 * Global.Upgraded) 
	
	get_node("LabP").text = str(Global.LabPoints)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("SpielstandLöschen"):
		get_node("DeleteGame").visible = true

		
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if LookForEnemy == true:
		get_node("sleepuwu").play("awake")
		get_node("LookForEnemy").value += 50 * delta
		if get_node("LookForEnemy").value == get_node("LookForEnemy").max_value:
			LookForEnemy = false
			get_tree().change_scene("res://Arena.tscn")
			
	$Cursor.position = get_viewport().get_mouse_position()
	
	
#	pass
func _input(event):
	if event is InputEventMouseMotion:
		get_node("Cursor").rotation_degrees += 0.7  * event.get_relative()[0]

func _on_Button_pressed():
	LookForEnemy = true


func _on_Research_pressed():
	if 50 * Global.Upgraded  < Global.LabPoints + 1:
		Global.LabPoints -= 50 * Global.Upgraded
		Global.Upgraded += 1
		get_node("Label").text = "Cost: " + str(50 * Global.Upgraded) 
		research()
	
	pass # Replace with function body.
	
func research():
	randomized = randi()%10 +1
	Global.LabPoints = int(round(Global.LabPoints))
	get_node("LabP").text = str(Global.LabPoints)
	Global.save("LabPoints", Global.LabPoints)
	Global.save("Upgraded", Global.Upgraded)
	
	if randomized == 1:
		get_node("ResAction").text = "+ 0.3 Power"
		Global.Strength += 0.3
		Global.save("Strength", Global.Strength)
	if randomized == 2:
		get_node("ResAction").text = "+ 0.1 Power"
		Global.Strength += 0.1
		Global.save("Strength", Global.Strength)
	if randomized == 3:
		get_node("ResAction").text = "+0.1 Power"
		Global.Strength += 0.1
		Global.save("Strength", Global.Strength)
	if randomized == 4:
		get_node("ResAction").text = "No Finds"
	if randomized == 5:
		get_node("ResAction").text = "+ 0.1 Power"
		Global.Strength += 0.1
		Global.save("Strength", Global.Strength)
	if randomized == 6:
		get_node("ResAction").text = "+ 0.2 Power"
		Global.Strength += 0.2
		Global.save("Strength", Global.Strength)
		Global.save("Strength", Global.Strength)
	if randomized == 7:
		get_node("ResAction").text = "+0.03 Power"
		Global.Strength += 0.03
		Global.save("Strength", Global.Strength)
	
	if randomized == 9:
		get_node("ResAction").text = "+0.06 Power"
		Global.Strength += 0.06
		Global.save("Strength", Global.Strength)
	if randomized == 10:
		get_node("ResAction").text = "+0.5 Power"
		Global.Strength += 0.5
		Global.save("Strength", Global.Strength)
	if randomized == 7 or Global.Upgraded == 2:
		if Global.Attacks < 7:
			
			Global.dopopup = true
			get_node("ResAction").text = "New Attack unlocked"
			Global.Attacks += 1
			Global.save("Attacks", Global.Attacks)
		else:
			get_node("ResAction").text = "No Finds"
	if randomized == 8 :
		if Global.Attacks < 7:
			
			Global.dopopup = true
			get_node("ResAction").text = "New Attack unlocked"
			Global.Attacks += 1
			Global.save("Attacks", Global.Attacks)
		else:
			get_node("ResAction").text = "No Finds"
		
		
	get_node("HP").text = "Health: " + str(15 * Global.Strength)
	get_node("Power").text = "Power: " + str(Global.Strength)
	get_node("Energy").text = "Energy: " + str(12 * Global.Strength)
	
	


func _on_RP_50_pressed():
	Global.Rank += 50


func _on_LP_50_pressed():
	Global.LabPoints += 1000000


func _on_mnz_pressed():
	Global.create_save()


func _on_HSlider2_value_changed(value):
	AudioServer.set_bus_volume_db(1, value -100)
	Global.save("Vol2", value)


func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(2, value -100)
	Global.save("Vol1", value)


func _on_Multiplayer_pressed():
	get_tree().change_scene("res://mp/multiplayer.tscn")


func _on_Cosm_pressed():
	get_tree().change_scene("res://CosmShop.tscn")


func _on_Fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen


func _on_EXIT_pressed():
	get_tree().quit()


func _on_Perks_pressed():
	get_tree().change_scene("res://Perks.tscn")


func _on_DeleteGame_pressed():
	Global.delete()
	pass # Replace with function body.



func _on_Debug_pressed():
	get_tree().change_scene("res://Debug Menu.tscn")

func _on_Reset_Panel_pressed():
	ResetCount += 1
	if ResetCount == 5:
		get_node("DeleteGame").visible = true
		$Debug.visible = true
	

