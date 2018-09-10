extends RigidBody2D

onready var shape = get_node("Shape")
onready var sprite0 = get_node("Sprite0")
onready var body1 = get_node("Body1")
onready var body2 = get_node("Body2")
onready var sprite1 = get_node("Body1/Sprite1")
onready var sprite2 = body2.get_node("Sprite2")

var cortada = false 

func _ready():
	randomize()
	born(Vector2(640,800))


func born(inipos):
	set_pos(inipos)
	var inivel = Vector2(0, rand_range(-1000,-800))
	if inipos.x < 640:
		inivel = inivel.rotated(deg2rad(rand_range(0, -30)))
	else:
		inivel = inivel.rotated(deg2rad(rand_range(0,30)))
		
	set_linear_velocity(inivel)
	set_angular_velocity(rand_range(-10,10))
	
func cut():
	if cortada: return
	cortada = true
	set_mode(MODE_KINEMATIC)
	sprite0.queue_free()
	shape.queue_free()
	body1.set_mode(MODE_RIGID)
	body2.set_mode(MODE_RIGID)