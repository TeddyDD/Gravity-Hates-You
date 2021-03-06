extends KinematicBody2D

var velocity = Vector2()
var planets = []
const MAX_HZ_SPEED = 100
var h_vel = Vector2()
var animation
var is_input = false
var lvl

func _fixed_process(delta):
	if !lvl.finished:
		var force = Vector2()
		if planets != []:
			for p in planets:
				var distance = p.get_pos().distance_squared_to(get_pos())
				if sqrt(distance) < p.radius * 2:
					force += p.mass * 2 * (p.get_pos() - get_pos()) / distance * delta
				else:
					force += (p.mass * 2 * (p.get_pos() - get_pos()) / distance * delta) * 0.5
		velocity += force * 1000 * delta
		var motion = velocity * delta
		set_rot( atan2(force.x, force.y) )
		move( motion )  
	
		if (is_colliding()):
			var n = get_collision_normal()
			motion = n.slide( motion ) 
			velocity = n.slide( velocity )
			is_input = false
			#go left
			if Input.is_action_pressed("ui_left"):
				is_input = true
				h_vel = Vector2(n.y, -n.x) * 1000
				velocity += h_vel * delta
				if animation.get_current_animation() != "run": 
					animation.play("run")
				get_node("Sprite").set_flip_h( true )
			#go right
			if Input.is_action_pressed("ui_right"):
				is_input = true
				h_vel = Vector2(-n.y, n.x) * 1000
				velocity += h_vel * delta
				
				#animation
				if animation.get_current_animation() != "run": 
					animation.play("run")
				get_node("Sprite").set_flip_h( false )
			#jump
			if Input.is_action_pressed("ui_select"):
				get_node("SamplePlayer2D").play("jump")
				velocity += -force * 200
				get_node("blast").set_emitting( true )
			#no input but coliding
			if not is_input:
				animation.play("idle")
			move( motion * 0.2)
		else: #not coliding
			animation.play("idle")
			is_input = false
	

func _ready():
	animation = get_node("AnimationPlayer")
	animation.play("idle")
	set_fixed_process(true)
	lvl = get_tree().get_current_scene()