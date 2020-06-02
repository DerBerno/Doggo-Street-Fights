extends Node2D


# Declare member variables here. Examples:
var a = 0
var Strength = 1
var randomized = 0
var Catto_Strength = 1
var Hood_Level = 1
var DamageMade = 0
var delta2
var Wintimer = 0
var Rank = 0
var off = false
var wings = 1
var hat = 1
onready var tween = $TextureRect/Tween
#perks:
var DamageDecrease = 1
var DamageIncrease = 1
var HealthIncrease = 1
var PowerIncrease = 1
var Ability = false
var AbilityActivated = false
var AbilityOff = false

# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.Perk == 1:
		DamageIncrease = 1.15
	if Global.Perk == 4:
		DamageIncrease = 1.20
	if Global.Perk == 7:
		DamageIncrease = 1.30
	
	if Global.Perk == 6:
		DamageDecrease = 0.8
	if Global.Perk == 9:
		DamageDecrease = 0.7
		
	if Global.Perk == 2:
		HealthIncrease = 1.10
	
	if Global.Perk == 5:
		PowerIncrease = 1.10
	if Global.Perk == 8:
		PowerIncrease = 1.20
	if Global.Perk == 10:
		PowerIncrease = 1.50
		
	
	if Global.dopopup == true:
		if Global.Attacks == 2:
			get_node("AcceptDialog").dialog_text = "Use PUNCH to deal damage, but using attacks requires Energy. So try using SLEEP to regenerate your energy!"
		if Global.Attacks == 3:
			get_node("AcceptDialog").dialog_text = "Use SNACK to heal yourself!"
		if Global.Attacks == 4:
			get_node("AcceptDialog").dialog_text = "SMASH deals more damage than PUNCH. But it also requires more Energy!"
		if Global.Attacks == 5:
			get_node("AcceptDialog").dialog_text = "The damage THORNS deals increases by the damage you get by the opponent! "
		if Global.Attacks == 6:
			get_node("AcceptDialog").dialog_text = "FIREBALL deals heavy damage to the opponent!"
		if Global.Attacks == 7:
			get_node("AcceptDialog").dialog_text = "Use BEPIS to heal up quickly!"
			
		
		Global.dopopup = false
		get_node("AcceptDialog").popup_centered()
	get_node("Doggo").play("Doggo")
	
	get_node("Cat").play("cat")
	
	wings = randi()%5+1
	if wings == 1 and Global.Rank >= 1000:
		get_node("Wings").play("01")
	if wings == 2 and Global.Rank >= 1500:
		get_node("Wings").play("02")
	if wings == 3 and Global.Rank >= 2000:
		get_node("Wings").play("03") 
	if wings == 4 and Global.Rank >= 2500:
		get_node("Wings").play("03")
	if wings == 5 and Global.Rank >= 700:
		get_node("Wings").play("02")
		
	hat = randi()%5+1
	if hat == 1 and Global.Rank >= 500:
		get_node("Hat").play("hat1")
	if hat == 2 and Global.Rank >= 3000:
		get_node("Hat").play("hat1")
	if hat == 3 and Global.Rank >= 4000:
		get_node("Hat").play("hat1")
	if hat == 4 and Global.Rank >= 750:
		get_node("Hat").play("hat2")
	if hat == 5 and Global.Rank >= 1500:
		get_node("Hat").play("hat2")
	
	
	
	if Global.Attacks > 2:
		get_node("Heal1").text = "[3] Snack"
		get_node("Heal1").disabled = false
	if Global.Attacks > 3:
		get_node("Punch").text = "[3] Smash"
		get_node("Punch").disabled = false
	if Global.Attacks > 4:
		get_node("Thorns").text = "[2] Thorns"
		get_node("Thorns").disabled = false
	if Global.Attacks > 5:
		get_node("Fireball").text = "[4] Fireball"
		get_node("Fireball").disabled = false
	if Global.Attacks > 6:
		get_node("Super Heal").text = "[7] Bepis"
		get_node("Super Heal").disabled = false
		
		
	
	get_node("LabPoints").text = "Laboratory Points: " + str(Global.LabPoints)
	get_node("Clouds/C1/C2follow").unit_offset += 0.4
	get_node("Rank").text = str(Global.Rank)
	
	if Global.Rank < 100:
		get_node("Rank/RankName").text = "Bronce III"
		get_node("Rank2").play("Bronze")
		Catto_Strength = 0.6
	if Global.Rank < 200 and Global.Rank > 99:
		Catto_Strength = 1
		get_node("Rank/RankName").text = "Bronce II"
		get_node("Rank2").play("Bronze")
	if Global.Rank < 300 and Global.Rank > 199:
		Catto_Strength = 1.5
		get_node("Rank/RankName").text = "Bronce I"
		get_node("Rank2").play("Bronze")
	if Global.Rank > 299:
		Ability = true
		get_node("Ability").text = "Ability charging"
	if Global.Rank < 450 and Global.Rank > 299:
		
		Catto_Strength = 2.4
		get_node("Rank/RankName").text = "Silver III"
		get_node("Rank2").play("Silver")
	if Global.Rank < 600 and Global.Rank > 449:
		Catto_Strength = 3.5
		get_node("Rank/RankName").text = "Silver II"
		get_node("Rank2").play("Silver")
	if Global.Rank < 750 and Global.Rank > 599:
		Catto_Strength = 4.5
		get_node("Rank/RankName").text = "Silver I"
		get_node("Rank2").play("Silver")
	if Global.Rank < 900 and Global.Rank > 749:
		Catto_Strength = 5
		get_node("Rank/RankName").text = "Gold III"
		get_node("Rank2").play("Gold")
	if Global.Rank < 1150 and Global.Rank > 899:
		Catto_Strength = 5.5
		get_node("Rank/RankName").text = "Gold II"
		get_node("Rank2").play("Gold")
	if Global.Rank < 1400 and Global.Rank > 1149:
		Catto_Strength = 6
		get_node("Rank/RankName").text = "Gold I"
		get_node("Rank2").play("Gold")
	if Global.Rank < 1700 and Global.Rank > 1399:
		Catto_Strength = 6.5
		get_node("Rank/RankName").text = "Diamond III"
		get_node("Rank2").play("Diamond")
	if Global.Rank < 2000 and Global.Rank > 1699:
		Catto_Strength = 7
		get_node("Rank/RankName").text = "Diamond II"
		get_node("Rank2").play("Diamond")
	if Global.Rank < 2500 and Global.Rank > 1999:
		Catto_Strength = 8
		get_node("Rank/RankName").text = "Diamond I"
		get_node("Rank2").play("Diamond") 
	if Global.Rank < 3000 and Global.Rank > 2499:
		Catto_Strength = 10
		get_node("Rank/RankName").text = "Legend III"
		get_node("Rank2").play("Legend")
	if Global.Rank < 4000 and Global.Rank > 2999:
		Catto_Strength = 12
		get_node("Rank/RankName").text = "Legend II"
		get_node("Rank2").play("Legend")
	if Global.Rank > 3999:
		Catto_Strength = 20 * Global.Rank / 4000
		get_node("Rank/RankName").text = "Legend"
		get_node("Rank2").play("Legend")
	if Global.Rank > 19999:
		get_node("Rank/RankName").text = "Challenger"
		get_node("Rank2").play("Challenger")
		
	
	randomized = randi()%10 +1
	Strength = Global.Strength * PowerIncrease
	
	
	get_node("Energy").max_value = 12 * Strength
	get_node("Energy").value = 4 * Strength
	get_node("DoggoLife").max_value = 15 * Strength * HealthIncrease
	get_node("CattoLife").max_value = 5 + randomized * Catto_Strength * 0.6
	get_node("DoggoLife").value = get_node("DoggoLife").max_value
	get_node("CattoLife").value = get_node("CattoLife").max_value
	get_node("DoggoLife/LifeLabel").text = str(get_node("DoggoLife").value) 
	get_node("CattoLife/LifeLabel").text = str(get_node("CattoLife").value) 
	get_node("Energy/EnergyLabel").text = str(get_node("Energy").value) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Clouds/C1/C1follow").unit_offset += 0.027 * delta * 0.5
	get_node("Clouds/C1/C2follow").unit_offset += 0.05 * delta * 0.5
	

	#tween.interpolate_property($TextureRect, "modulate", Color(1,1,1), Color(0.5, 0.5, 0.5), 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	#tween.start()

	get_node("TextureRect/Path2D/PathFollow2D").unit_offset += 0.001 * delta 
	
	
	if get_node("CattoLife").value <= 0 or off == true: 
		get_node("theLabel").text = "You won"
		if Wintimer == 0: 
			
			get_node("Cat").play("Kill")
			Global.Rank += 10 + randomized * Catto_Strength	
			get_node("Rank/RankPlus").text = "+" + str(10 + randomized * Catto_Strength	)
			Global.save("Rank", Global.Rank)
			get_node("Rank").text = str(Global.Rank)
			Global.LabPoints += round( 10 + randomized * 5 * Catto_Strength)
			print(round( 10 + randomized * 5 * Catto_Strength))
			get_node("LabPoints").text = "Laboratory Points:" + str(Global.LabPoints)
			get_node("LabPoints/Plus").text = "+" + str(10 + randomized * 5 * Catto_Strength)
			Global.save("LabPoints", Global.LabPoints)
			disable()
		Wintimer =  Wintimer + 1 * delta
		if Wintimer > 3:
			get_tree().change_scene("res://Menu.tscn")
			get_node("CattoLife").value = get_node("CattoLife").max_value
			enable()
	
	if get_node("DoggoLife").value <= 0 or off == true:
		get_node("theLabel").text = "You lost"	
		if Wintimer == 0:
			
			get_node("Doggo").play("Sleep")
			Global.Rank -= 5 + randomized * Catto_Strength
			get_node("Rank/RankPlus").text = "-" + str(5 + randomized * Catto_Strength)
			Global.save("Rank", Global.Rank)
			get_node("Rank").text = str(Global.Rank)
			Global.LabPoints += 5 + randomized * 2 * Catto_Strength
			get_node("LabPoints").text = "Laboratory Points:" + str(Global.LabPoints)
			get_node("LabPoints/Plus").text = "+" + str(5 + randomized * 2 * Catto_Strength)
			Global.save("LabPoints", Global.LabPoints)
			disable()
		Wintimer =  Wintimer + 1 * delta
		if Wintimer > 3:
			get_tree().change_scene("res://Menu.tscn")
			get_node("CattoLife").value = get_node("CattoLife").max_value
			get_node("DoggoLife").value = get_node("DoggoLife").max_value
			enable()
	$Cursor.position = get_viewport().get_mouse_position()
	
	
#	pass
func _input(event):
	if event is InputEventMouseMotion:
		get_node("Cursor").rotation_degrees += 1  * event.get_relative()[0]

	
	
func _on_Button_pressed():
	if get_node("Energy").value > 0.99:
		if get_node("DoggoLife").value >= 0 and get_node("CattoLife").value >= 0:
			Turn("Attack")

func _on_Simple_Heal_pressed():
	if get_node("Energy").value > 2.99:
		if get_node("DoggoLife").value >= 0 and get_node("CattoLife").value >= 0:
			Turn("Heal1")
	
func _on_Power_Punch_pressed():
	if get_node("Energy").value > 2.99:
		if get_node("DoggoLife").value >= 0 and get_node("CattoLife").value >= 0:
			Turn("Punch")

func _on_Thorns_pressed():
	if get_node("Energy").value > 1.99:
		if get_node("DoggoLife").value >= 0 and get_node("CattoLife").value >= 0:
			Turn("Thorns")
	
func _on_Fireball_pressed():
	if get_node("Energy").value > 3.99:
		if get_node("DoggoLife").value >= 0 and get_node("CattoLife").value >= 0:
			Turn("Fireball")
	
func _on_Super_Heal_pressed():
	if get_node("Energy").value > 6.99:
		if get_node("DoggoLife").value >= 0 and get_node("CattoLife").value >= 0:
			Turn("Heal2")
	
func _on_Sleep_pressed():
	if get_node("DoggoLife").value >= 0 and get_node("CattoLife").value >= 0:
		Turn("Sleep")
	

	
	pass # Replace with function body.


func Delay(Time):
	var T = Timer.new()
	T.set_wait_time(Time)
	T.set_one_shot(true)
	self.add_child(T)
	T.start()
	yield(T, "timeout")
	T.queue_free()


func Turn(DoggoAction):
	randomized = randi()%10 +1
	print(str(randomized))
	disable()
	
	if get_node("DoggoLife").value == 0 or get_node("CattoLife").value == 0:
		randomized = 0
	
	
	
	
	if randomized == 0:
		pass
	
	if randomized == 1:
		get_node("Cat").play("Fist")
		yield(get_node("Cat"),"animation_finished")
		get_node("Cat").play("cat")
		get_node("DoggoLife").value -= 2 * Catto_Strength * DamageDecrease
		DamageMade = 2
		get_node("Sounds/hit1").play()
		
		
		
	if randomized == 2:
		get_node("Cat").play("Fist")
		yield(get_node("Cat"),"animation_finished")
		get_node("Cat").play("cat")
		get_node("DoggoLife").value -= 2 * Catto_Strength * DamageDecrease
		DamageMade = 4
		get_node("Sounds/hit3").play()
		
	if randomized == 3:
		get_node("Cat").play("Fist")
		yield(get_node("Cat"),"animation_finished")
		get_node("Cat").play("cat")
		get_node("DoggoLife").value -= 1 * Catto_Strength * DamageDecrease
		DamageMade = 1
		get_node("Sounds/hit2").play()
		
	if randomized == 4:
		get_node("Cat").play("Fire")
		yield(get_node("Cat"),"animation_finished")
		get_node("Cat").play("cat")
		get_node("DoggoLife").value -= 3 * Catto_Strength * DamageDecrease
		DamageMade = 4
		get_node("Sounds/fire").play()
		
	if randomized == 5:
		get_node("Cat").play("Heal")
		yield(get_node("Cat"),"animation_finished")
		get_node("Cat").play("cat")
		get_node("CattoLife").value += 1 * Catto_Strength	
		DamageMade = 0
		get_node("Sounds/heal").play()
	if randomized == 6:
		get_node("Cat").play("Knife")
		yield(get_node("Cat"),"animation_finished")
		get_node("Cat").play("cat")
		get_node("DoggoLife").value -= 2 * Catto_Strength * DamageDecrease
		DamageMade = 2
		get_node("Sounds/knife").play()
	if randomized == 7:
		get_node("Cat").play("Fire")
		yield(get_node("Cat"),"animation_finished")
		get_node("Cat").play("cat")
		get_node("DoggoLife").value -= 4 * Catto_Strength * DamageDecrease
		DamageMade = 4
		get_node("Sounds/fire").play()
	if randomized == 8:
		get_node("Cat").play("Knife")
		yield(get_node("Cat"),"animation_finished")
		get_node("Cat").play("cat")
		get_node("DoggoLife").value -= 3 * Catto_Strength * DamageDecrease
		DamageMade = 3
		get_node("Sounds/knife").play()
	if randomized == 9:
		get_node("DoggoLife").value -= 0 * Catto_Strength
		get_node("Cat").play("Sleep")
		yield(get_node("Cat"),"animation_finished")
		get_node("Cat").play("cat")
		DamageMade = 0
	if randomized == 10:
		get_node("Cat").play("Sleep")
		yield(get_node("Cat"),"animation_finished")
		get_node("Cat").play("cat")
		get_node("DoggoLife").value -= 0 * Catto_Strength
		DamageMade = 0
	
	updateStats()
	if Global.Perk == 3:
		randomized = randi()%10+1
		if randomized == 1 or randomized == 2:
			get_node("2x").play("2x")
			DamageIncrease = 2
		if randomized > 2:
			pass
	
	if Ability == true:
		get_node("SpecialAttack").value += 1
		if get_node("SpecialAttack").value == get_node("SpecialAttack").max_value:
			AbilityActivated = true
			
	if AbilityActivated == true and AbilityOff == false:
		get_node("Ability").text = "Ability activated"
		if Global.SpAttack == 1:
			get_node("Energy").value += 0.5 * Strength
		if Global.SpAttack == 2:
			get_node("CattoLife").value -= 1*Strength
		if Global.SpAttack == 3:
			get_node("DoggoLife").value *= 2
			AbilityActivated = false
			AbilityOff = true
		if Global.SpAttack == 4:
			get_node("Energy").value *= 2
			AbilityActivated = false
			AbilityOff = true
		if Global.SpAttack == 5:
			get_node("DoggoLife").value += 1.5 * Strength
		
	
	if DoggoAction == "Attack" and get_node("DoggoLife").value > 0 :
		if off == false:
		
			get_node("Doggo").play("Tailkick")
			yield(get_node("Doggo"),"animation_finished")
			get_node("Doggo").play("Doggo")
			get_node("CattoLife").value -= 1.2* Strength * DamageIncrease
			get_node("Energy").value -= 1
			get_node("Sounds/hit1").play()
			enable()
	if DoggoAction == "Heal1" and get_node("DoggoLife").value > 0 :
		if off == false:
		
			get_node("Doggo").play("Snacc")
			yield(get_node("Doggo"),"animation_finished")
			get_node("Doggo").play("Doggo")
			get_node("DoggoLife").value += 3* Strength
			get_node("Energy").value -= 3
			get_node("Sounds/snack").play()
		enable()
	if DoggoAction == "Punch" and get_node("DoggoLife").value > 0 :
		if off == false:
			smash()
			
		
			get_node("Doggo").play("Punch")
			yield(get_node("Doggo"),"animation_finished")
			
			updateStats()
			
			get_node("Doggo").play("Doggo")
			get_node("CattoLife").value -= 2.3* Strength * DamageIncrease
			get_node("Energy").value -= 3
			get_node("Sounds/hit2").play()
			enable()
	if DoggoAction == "Thorns" and get_node("DoggoLife").value > 0 :
		if off == false:
		
			get_node("Doggo").play("Thorns")
			yield(get_node("Doggo"),"animation_finished")
			get_node("Doggo").play("Doggo")
			get_node("CattoLife").value -= 1.5 * Catto_Strength * DamageMade * DamageIncrease
			get_node("Energy").value -= 2
			get_node("Sounds/hit3").play()
			enable()
	if DoggoAction == "Fireball" and get_node("DoggoLife").value > 0 :
		if off == false:
			get_node("Doggo").play("Fireball")
			yield(get_node("Doggo"),"animation_finished")
			get_node("Doggo").play("Doggo")
			get_node("CattoLife").value -= 4.2* Strength * DamageIncrease
			get_node("Energy").value -= 4
			get_node("Sounds/fireball").play()
			enable()
	if DoggoAction == "Heal2" and get_node("DoggoLife").value > 0 :
		if off == false:
			get_node("Doggo").play("Bepis")
			yield(get_node("Doggo"),"animation_finished")
			get_node("Doggo").play("Doggo")
			get_node("DoggoLife").value += 10* Strength
			get_node("Energy").value -= 8
			get_node("Sounds/bepis").play()
			enable()
	if DoggoAction == "Sleep" and get_node("DoggoLife").value > 0 :
		if off == false:
		
			get_node("Doggo").play("Sleep")
			yield(get_node("Doggo"),"animation_finished")
			get_node("Doggo").play("Doggo")
			
		
			get_node("Energy").value += 3 * Strength
			enable()
	if Global.Perk == 3:
		DamageIncrease = 1
	
			
			
	updateStats()
		
			
		
		
		
	
		
	#if get_node("Energy").value == 0 or get_node("Energy").value < 0:
	#	Turn("AutoSleep")
	
func disable():
	get_node("Tail Kick").disabled = true
	get_node("Heal1").disabled = true
	get_node("Punch").disabled = true
	get_node("Thorns").disabled = true
	get_node("Fireball").disabled = true
	get_node("Super Heal").disabled = true
	get_node("Sleep").disabled = true

func enable():
	get_node("Sleep").disabled = false
	get_node("Tail Kick").disabled = false
	get_node("Heal1").disabled = false
	get_node("Heal1").disabled = true
	if Global.Attacks > 2:
		get_node("Heal1").text = "[3] Snack"
		get_node("Heal1").disabled = false
	if Global.Attacks > 3:
		get_node("Punch").text = "[3] Smash"
		get_node("Punch").disabled = false
	if Global.Attacks > 4:
		get_node("Thorns").text = "[2] Thorns"
		get_node("Thorns").disabled = false
	if Global.Attacks > 5:
		get_node("Fireball").text = "[4] Fireball"
		get_node("Fireball").disabled = false
	if Global.Attacks > 6:
		get_node("Super Heal").text = "[7] Bepis"
		get_node("Super Heal").disabled = false

func smash():
	get_node("DoggoWings").position[0] = 320 - 32
	get_node("Timer").start()
	yield(get_node("Timer"), "timeout")
	get_node("DoggoWings").position[0] = 352 - 32
	get_node("Timer").start()
	yield(get_node("Timer"), "timeout")
	get_node("DoggoWings").position[0] = 384 - 32
	get_node("Timer").start()
	yield(get_node("Timer"), "timeout")
	get_node("DoggoWings").position[0] = 352 - 32
	get_node("Timer").start()
	yield(get_node("Timer"), "timeout")
	get_node("DoggoWings").position[0] = 320 - 32
	get_node("Timer").start()
	yield(get_node("Timer"), "timeout")
	get_node("DoggoWings").position[0] = 288 - 32
	

func updateStats():
	get_node("DoggoLife/LifeLabel").text = str(get_node("DoggoLife").value) 
	get_node("CattoLife/LifeLabel").text = str(get_node("CattoLife").value) 
	get_node("Energy/EnergyLabel").text = str(get_node("Energy").value) 
