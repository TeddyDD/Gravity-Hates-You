extends Node

var music_pos = 1

var current_level # path to scene
var level_data = [
	{"name" :"Tutorial", "file": "res://levels/tutorial.xml", "time": null},
	{"name" :"Tutorial - Jumping", "file": "res://levels/tutorial2.xml", "time": null},
	{"name" :"Give it to me", "file": "res://levels/level1.xml", "time": null},
	{"name" :"Bigger is Better", "file": "res://levels/level2.xml", "time": null},
	{"name" :"I said nothing", "file": "res://levels/level3.xml", "time": null},
	{"name" :"666?", "file": "res://levels/level4.xml", "time": null},
	{"name" :"Catch 'Em All", "file": "res://levels/level8.xml", "time": null},
	{"name" :"Be happy", "file": "res://levels/level6.xml", "time": null},
	{"name" :"That was Test level", "file": "res://levels/test_level.xml", "time": null},
	{"name" :"Be quick or stuck", "file": "res://levels/level7.xml", "time": null},
	{"name" :"Fly Adam, fly!", "file": "res://levels/level5.xml", "time": null},
]

func _ready():
	load_level_data()
	
func finish(state, time):
	load_level_data()
	#if reset then reload
	if state == "reset":
		get_tree().change_scene(current_level)
	#if esc then load menu / level menu #TODO
	if state == "menu":
		get_tree().change_scene("res://scenes/select.xml")
	
	#if finished then save score and load next level
	if state == "finish":
		var file = ConfigFile.new()
		var err = file.load( "user://save.bin" )
		var l = get_current_level_data()
		file.set_value( l.name, "time", time )
		load_level_data()
		err = file.save( "user://save.bin" )
	pass
	
func get_current_level_data():
	for l in level_data:
			if l.file == current_level:
				return l

func get_current_level_id():
	for i in range( level_data.size() ):
		if level_data[i].file == current_level:
			prints("current level id ", i)
			return i

func load_level_data():

	var file = ConfigFile.new()
	var err = file.load( "user://save.bin" )
	if (err):
		file.save("user://save.bin")
	for level in level_data:
		prints( level.name )
		level.time =  file.get_value( level.name, "time" )