#new version of planet class
extends Sprite

var radius = 160.0               # size of planet and collider
export(float) var mass   = 1000  # mass (gravity)
export(float) var period = 20    # rotation

func _ready():
	if get_scale() != Vector2(1,1):
		radius = get_scale().x * radius
		prints(radius)
	get_node("../Player").planets.append(self)
	
func get_scale( radius ):
	var factor = 160 / radius
	return Vector2(factor, factor)