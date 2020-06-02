extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
		
	if Global.Rank > 299:
		get_node("SA1").text = "Regenerate Enery without sleeping"
		get_node("SA1/1").disabled = false
		
	if Global.Rank > 749:
		get_node("Menu/P1/CB1").disabled = false
		get_node("Menu/P1").text = "Deal 15% more damage"
		
		get_node("SA2/2").disabled = false
		get_node("SA2").text = "Poison your enemy"
		
		
	if Global.Rank > 899:
		get_node("Menu/P2/CB2").disabled = false
		get_node("Menu/P2").text = "10% more Health"
		
		
		
		
	if Global.Rank > 1149:
		get_node("Menu/P3/CB3").disabled = false
		get_node("Menu/P3").text = "20% Chance to double your damage"
		
	
		
	if Global.Rank > 1399:
		get_node("Menu/P4/CB4").disabled = false
		get_node("Menu/P4").text = "Deal 20% more damage"
		get_node("SA3/3").disabled = false
		get_node("SA3").text = "Double your Health"
		
		
		
	if Global.Rank > 1699:
		get_node("Menu/P5/CB5").disabled = false
		get_node("Menu/P5").text = "Increase your power by 10%"
		
	if Global.Rank > 1999:
		get_node("Menu/P6/CB6").disabled = false
		get_node("Menu/P6").text = "Take 20% less damage"
		
	if Global.Rank > 2499:
		get_node("Menu/P7/CB7").disabled = false
		get_node("Menu/P7").text = "Deal 30% more damage"
		get_node("SA4/4").disabled = false
		get_node("SA4").text = "Double your Energy"
		
	if Global.Rank > 2999:
		get_node("Menu/P8/CB8").disabled = false
		get_node("Menu/P8").text = "Increase your power by 20%"
		
	if Global.Rank > 3999:
		get_node("Menu/P9/CB9").disabled = false
		get_node("Menu/P9").text = "Take 30% less damage"
	
	if Global.Rank > 19999:
		get_node("Menu/P10/CB10").disabled = false
		get_node("Menu/P10").text = "Increase your power by 50%"
		get_node("SA5/5").disabled = false
		get_node("SA5").text = "Regenerate every round"
		
	
		
	
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseMotion:
		get_node("Cursor").rotation_degrees += 1  * event.get_relative()[0]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Cursor.position = get_viewport().get_mouse_position()
#	pass


func _on_CB1_pressed():
	Global.Perk = 1
	pass # Replace with function body.


func _on_CB2_pressed():
	Global.Perk = 2
	pass # Replace with function body.


func _on_CB3_pressed():
	Global.Perk = 3
	pass # Replace with function body.


func _on_CB4_pressed():
	Global.Perk = 4
	pass # Replace with function body.


func _on_CB5_pressed():
	Global.Perk = 5
	pass # Replace with function body.


func _on_CB6_pressed():
	Global.Perk = 6
	pass # Replace with function body.


func _on_CB7_pressed():
	Global.Perk = 7
	pass # Replace with function body.


func _on_CB8_pressed():
	Global.Perk = 8
	pass # Replace with function body.


func _on_CB9_pressed():
	Global.Perk = 9
	pass # Replace with function body.


func _on_CB10_pressed():
	Global.Perk = 10
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://Menu.tscn")
	pass # Replace with function body.


func _on_1_pressed():
	Global.SpAttack = 1
	pass # Replace with function body.


func _on_2_pressed():
	Global.SpAttack = 2
	pass # Replace with function body.


func _on_3_pressed():
	Global.SpAttack = 3
	pass # Replace with function body.


func _on_4_pressed():
	Global.SpAttack = 4
	pass # Replace with function body.


func _on_5_pressed():
	Global.SpAttack = 5
	pass # Replace with function body.
