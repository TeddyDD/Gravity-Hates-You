#new version of planet class
extends Sprite

var radius = 160.0               # size of planet and collider
export(float) var mass   = 1000  # mass (gravity)
export(float) var period = 20    # rotation

func _ready():
	var tex = "res://textures/planet_" + str( randi() % 9 ) + ".png"
	set_texture( load( tex ) )
	set_rot( deg2rad( randi() % 361) )
	if get_scale() != Vector2(1,1):
		radius = get_scale().x * radius
		prints(radius)
		mass = get_scale().x * mass
	get_node("../Player").planets.append(self)
	
func get_scale_by_radius( radius ):
	var factor = 160 / radius
	return Vector2(factor, factor)