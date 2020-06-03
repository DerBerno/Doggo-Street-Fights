extends Node


# Declare member variables here. Examples:
var savegame = File.new() #file
var save_path = "user://save_i.lovedoggos" #place of the file
var save_data = {} #variable to store data
var Strength = 1
var Rank = 0
var Attacks = 2
var LabPoints = 1
var Upgraded = 1
var dopopup = false
var Perk = 0
var SpAttack = 0

const defaults = {"Strength":1,"Rank":0,"Attacks":2,"LabPoints":0,"Upgraded":0,"Vol1":100,"Vol2":100,"Perk":0,"Ability":0}

# Called when the node enters the scene tree for the first time.
func _ready():
	SpAttack = read_savegame("Ability")
	Perk = read_savegame("Perk")
	
	if not savegame.file_exists(save_path):
		dopopup = true
		create_save()

		save("Strength", defaults["Strength"])
		save("Rank", defaults["Rank"])
		save("Attacks", defaults["Attacks"])
		save("LabPoints", defaults["LabPoints"])
		save("Upgraded", defaults["Upgraded"])
		save("Vol1", defaults["Vol1"])
		save("Vol2", defaults["Vol2"])
		save("Perk", defaults["Perk"])
		save("Ability", defaults["Ability"])
	
	Strength = (Global.read_savegame("Strength"))
	Rank = (Global.read_savegame("Rank"))
	Attacks = (Global.read_savegame("Attacks"))
	LabPoints = (Global.read_savegame("LabPoints"))
	Upgraded = (Global.read_savegame("Upgraded"))
	 # Replace with function body.

func create_save():
   savegame.open(save_path, File.WRITE)
   savegame.store_var(save_data)
   savegame.close()

func save(Name, Value):    
   save_data[Name] = Value #data to save
   savegame.open(save_path, File.WRITE) #open file to write
   savegame.store_var(save_data) #store the data
   savegame.close() # close the file

func read_savegame(Name):
	savegame.open(save_path, File.READ) #open the file
	save_data = savegame.get_var() #get the value
	savegame.close() #close the file
	if save_data.has(Name):
		return save_data[Name] #return the value
	elif Name == "Vol1":
		save("Vol1", 100)
		return 100
	elif Name == "Vol2":
		save("Vol2", 100)
		return 100
	elif Name == "Perk":
		save("Perk", 0)
		return 0
	elif Name == "Ability":
		save("Ability", 0)
		return 0
		
	
func refresh():
	Global.Strength = read_savegame("Strength")
	Global.Rank = read_savegame("Rank")
	Global.Attacks = read_savegame("Attacks")
	Global.LabPoints = read_savegame("LabPoints")
	Global.Upgraded = read_savegame("Upgraded")
	Global.Vol1 = read_savegame("Vol1")
	Global.Vol2 = read_savegame("Vol2")
	Global.Perk = read_savegame("Perk")
	Global.Ability = read_savegame("Ability")
	
	
	
func delete():
	save("Strength", defaults["Strength"])
	save("Rank", defaults["Rank"])
	save("Attacks", defaults["Attacks"])
	save("LabPoints", defaults["LabPoints"])
	save("Upgraded", defaults["Upgraded"])
	save("Vol1", defaults["Vol1"])
	save("Vol2", defaults["Vol2"])
	save("Perk", defaults["Perk"])
	save("Ability", defaults["Ability"])

