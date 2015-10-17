extends Node

var current_level # path to scene
var level_data = [
	{"name" :"Tutorial", "file": "res://levels/tutorial.xml", "time": null},
	{"name" :"First steps", "file": "res://scenes/level.xml", "time": null},
]

func _ready():
	load_level_data()
	pass

func finish(state, time):
	#if reset then reload
	if state == "reset":
		get_tree().change_scene(current_level)
	#if esc then load menu / level menu #TODO
	if state == "menu":
		get_tree().change_scene("res://scenes/menu.xml")
	
	#if finished then save score and load next level
	if state == "finish":
		var file = ConfigFile.new()
		var err = file.load( "user://save.bin" )
		for l in level_data:
			prints(l.name, "SAVE")
			if l.file == current_level:
				file.set_value( l.name, "time", time )
				load_level_data()
		err = file.save( "user://save.bin" )
	pass

func load_level_data():

	var file = ConfigFile.new()
	var err = file.load( "user://save.bin" )
	if (err):
		file.save("user://save.bin")
	for level in level_data:
		prints( level.name )
		level.time =  file.get_value( level.name, "time" )