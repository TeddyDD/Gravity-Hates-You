extends KinematicBody2D

var velocity = Vector2()
var planets = []

func _fixed_process(delta):
	var force = Vector2()
	#TEMP
	planets.append(get_node("../Planet"))
	planets.append(get_node("../Planet1"))
	
	for p in planets:
		var distance = p.get_pos().distance_squared_to(get_pos())
		force += p.mass * 2 * (p.get_pos() - get_pos()) / distance * delta
	
	pass
#    var p = get_node("../Planet").get_pos()
#    var v = p - get_pos()
#    velocity.y += delta * v.y
#    velocity.x += delta * v.x
#    #rotate right (clockwise)        #right
#    var v_right = Vector2(-v.y,v.x)
#    #rotate left (counter-clockwise) #left
#    var v_left = Vector2(v.y,-v.x)
#    if Input.is_action_pressed("ui_left"):
#        velocity += delta * v_right * 0.5
#    if Input.is_action_pressed("ui_right"):
#        velocity += delta * v_left * 0.5
#
#
#	velocity += delta * v * 3
	velocity += force * delta
	var motion = velocity * delta
	set_rot( force.atan2() )
	move( motion )  
#    
	if (is_colliding()):
		var n = get_collision_normal()
		motion = n.slide( motion ) 
		velocity = n.slide( velocity )
		move( motion * 0.5 )

func _ready():
    set_fixed_process(true)