extends KinematicBody2D

const GRAVITY = 200.0
var velocity = Vector2()

func _fixed_process(delta):
    var p = get_node("../Planet").get_pos()
    var v = p - get_pos()
#    velocity.y += delta * v.y
#    velocity.x += delta * v.x
    #rotate right (clockwise)        #right
    var v_right = Vector2(-v.y,v.x)
    #rotate left (counter-clockwise) #left
    var v_left = Vector2(v.y,-v.x)
    if Input.is_action_pressed("ui_left"):
        velocity += delta * v_right * 0.5
    if Input.is_action_pressed("ui_right"):
        velocity += delta * v_left * 0.5


    velocity += delta * v * 3

    var motion = velocity * delta
    set_rot( v.atan2() )
    move( motion )  
    
    if (is_colliding()):
        var n = get_collision_normal()
        motion = n.slide( motion ) 
        velocity = n.slide( velocity )
        move( motion * 0.5 )

func _ready():
    set_fixed_process(true)