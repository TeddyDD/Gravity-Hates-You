extends KinematicBody2D

var velocity = Vector2()
var planets = []
const MAX_HZ_SPEED = 100
var h_vel = Vector2()

func _fixed_process(delta):
	var force = Vector2()
	#TEMP
	if planets != []:
		for p in planets:
			var distance = p.get_pos().distance_squared_to(get_pos())
			if sqrt(distance) < p.radius * 2:
				force += p.mass * 2 * (p.get_pos() - get_pos()) / distance * delta
			else:
				force += (p.mass * 2 * (p.get_pos() - get_pos()) / distance * delta) * 0.5
	velocity += force * 1000 * delta
	var motion = velocity * delta
	set_rot( force.atan2() )
	move( motion )  
#    
	if (is_colliding()):
		var n = get_collision_normal()
		motion = n.slide( motion ) 
		velocity = n.slide( velocity )
		if Input.is_action_pressed("ui_left"):
			h_vel = Vector2(n.y, -n.x) * 1000
			velocity += h_vel * delta
		if Input.is_action_pressed("ui_right"):
			h_vel = Vector2(-n.y, n.x) * 1000
			velocity += h_vel * delta
		if Input.is_action_pressed("ui_select"):
			velocity += -force * 200
		move( motion * 0.2)

func _ready():
	set_fixed_process(true)